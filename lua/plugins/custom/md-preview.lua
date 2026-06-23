local M = {}

local active_previews = {}

function M.start()
    local bufnr = vim.api.nvim_get_current_buf()

    if active_previews[bufnr] then
        vim.ui.open('file://' .. active_previews[bufnr].html_path)
        return
    end

    local filepath = vim.fn.expand('%:p')
    local dir = vim.fn.tempname()
    vim.fn.mkdir(dir, 'p')

    local html_path = dir .. '/preview.html'
    local js_path = dir .. '/md_content.js'

    local html_content = [[
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>Markdown Preview</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/github-markdown-css/5.2.0/github-markdown.min.css">
  <script src="https://cdn.jsdelivr.net/npm/marked/marked.min.js"></script>
  <style>
    body {
      box-sizing: border-box;
      min-height: 100vh;
      margin: 0;
      padding: 45px;
      display: flex;
      justify-content: center;
      background-color: var(--color-canvas-subtle) !important;
    }
    .preview-container {
      box-sizing: border-box;
      min-width: 200px;
      max-width: 980px;
      width: 100%;
      padding: 45px;
      background-color: var(--color-canvas-default);
      border: 1px solid var(--color-border-default);
      border-radius: 6px;
      height: fit-content;
    }
    @media (max-width: 767px) {
      body {
        padding: 15px;
      }
      .preview-container {
        padding: 20px;
      }
    }
  </style>
</head>
<body class="markdown-body">
  <div id="content" class="preview-container">Loading...</div>
  <script>
    function update() {
      var oldScript = document.getElementById('content-script');
      if (oldScript) oldScript.remove();
      var script = document.createElement('script');
      script.id = 'content-script';
      script.src = 'md_content.js?t=' + new Date().getTime();
      script.onload = function() {
        if (window.md_content) {
          document.getElementById('content').innerHTML = marked.parse(window.md_content);
        }
      };
      document.head.appendChild(script);
    }
    setInterval(update, 1000);
    update();
  </script>
</body>
</html>
]]
    local f_html = io.open(html_path, 'w')
    if f_html then
        f_html:write(html_content)
        f_html:close()
    else
        vim.notify('Failed to create preview HTML file', vim.log.levels.ERROR)
        return
    end

    local function write_content()
        if not vim.api.nvim_buf_is_valid(bufnr) then
            return
        end
        local lines = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)
        local md_text = table.concat(lines, '\n')
        local escaped = md_text
            :gsub('\\', '\\\\')
            :gsub('`', '\\`')
            :gsub('%$', '\\$')
            :gsub('</[sS][cC][rR][iI][pP][tT]>', '<\\/script>')
        local f_js = io.open(js_path, 'w')
        if f_js then
            f_js:write('window.md_content = `' .. escaped .. '`;')
            f_js:close()
        end
    end
    write_content()

    local group = vim.api.nvim_create_augroup('md_preview_' .. bufnr, { clear = true })

    vim.api.nvim_create_autocmd({ 'TextChanged', 'TextChangedI', 'BufWritePost' }, {
        buffer = bufnr,
        group = group,
        callback = write_content,
    })

    vim.api.nvim_create_autocmd('BufDelete', {
        buffer = bufnr,
        group = group,
        callback = function()
            pcall(vim.api.nvim_del_augroup_by_id, group)
            pcall(os.remove, js_path)
            pcall(os.remove, html_path)
            pcall(os.remove, dir)
            active_previews[bufnr] = nil
        end,
    })

    active_previews[bufnr] = {
        group = group,
        js_path = js_path,
        html_path = html_path,
        dir = dir,
    }

    vim.ui.open('file://' .. html_path)
    vim.notify('Markdown preview started', vim.log.levels.INFO)
end

return M
