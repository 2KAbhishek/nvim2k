local options = {
    backup = false, -- creates a backup file
    clipboard = "unnamedplus", -- allows neovim to access the system clipboard
    cmdheight = 1, -- more space in the neovim command line for displaying messages
    completeopt = { "menuone", "noselect" }, -- mostly just for cmp
    conceallevel = 0, -- so that `` is visible in markdown files
    fileencoding = "utf-8", -- the encoding written to a file
    hlsearch = true, -- highlight all matches on previous search pattern
    ignorecase = true, -- ignore case in search patterns
    mouse = "a", -- allow the mouse to be used in neovim
    pumheight = 10, -- pop up menu height
    showmode = false, -- we don't need to see things like -- INSERT -- anymore
    showtabline = 0, -- always show tabs
    smartcase = true, -- smart case
    smartindent = true, -- make indenting smarter again
    splitbelow = true, -- force all horizontal splits to go below current window
    splitright = true, -- force all vertical splits to go to the right of current window
    swapfile = false, -- creates a swapfile
    termguicolors = true, -- set term gui colors (most terminals support this)
    timeoutlen = 1000, -- time to wait for a mapped sequence to complete (in milliseconds)
    updatetime = 50, -- faster completion (4000ms default)
    writebackup = false, -- do not edit backups
    expandtab = true, -- convert tabs to spaces
    shiftwidth = 4, -- the number of spaces inserted for each indentation
    tabstop = 4, -- insert 2 spaces for a tab
    cursorline = false, -- highlight the current line
    number = true, -- set numbered lines
    laststatus = 3,
    showcmd = false,
    relativenumber = true, -- set relative numbered lines
    numberwidth = 4, -- set number column width to 2 {default 4}
    signcolumn = "yes", -- always show the sign column, otherwise it would shift the text each time
    wrap = false, -- display lines as one long line
    scrolloff = 10, -- is one of my fav
    sidescrolloff = 8,
    listchars = { trail = '', tab = '', nbsp = "_", extends = '>', precedes = '<' }, -- highlight
    list = true,
    wildmenu = true, -- wildmenu
    sessionoptions="blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal",
    autoindent = true,
    shell = 'zsh',
    inccommand = 'split',
    smarttab = true,
    breakindent = true,
    ai = true,
    si = true,
    backspace = 'indent,eol,start',
    undodir = os.getenv("HOME") .. "/.vim/undodir",
    undofile = true, -- enable persistent undo
}

 vim.cmd([[
     setlocal spell spelllang=en "Set spellcheck language to en
     setlocal spell! "Disable spell checks by default
     filetype plugin indent on
     if has('win32')
        let g:python3_host_prog = $HOME . '/scoop/apps/python/current/python.exe'
     endif
 ]])

vim.opt.path:append { '**' }

-- Undercurl
vim.cmd([[let &t_Cs = "\e[4:3m"]])
vim.cmd([[let &t_Ce = "\e[4:0m"]])

-- Turn off paste mode when leaving insert
-- vim.api.nvim_create_autocmd("InsertLeave", {
--   pattern = '*',
--   command = "set nopaste"
-- })

vim.opt.shortmess:append "c"

for k, v in pairs(options) do
    vim.opt[k] = v
end

vim.cmd "set whichwrap+=<,>,[,],h,l"
vim.cmd [[set iskeyword+=-]]
