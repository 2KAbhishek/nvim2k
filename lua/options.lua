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
    undofile = true, -- enable persistent undo
    updatetime = 0, -- faster completion (4000ms default)
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
    scrolloff = 8, -- is one of my fav
    sidescrolloff = 8,
    listchars = { trail = '', tab = '', nbsp = "_", extends = '>', precedes = '<' }, -- highlight
    list = true,
    wildmenu = true, -- wildmenu
    sessionoptions="blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal",
}

 vim.cmd([[
     setlocal spell spelllang=en "Set spellcheck language to en
     setlocal spell! "Disable spell checks by default
     filetype plugin indent on
 ]])

-- set backspace=indent,eol,start
-- autoindent = true, -- Enable autoindent
-- hidden = true, -- Needed for toggleterm
-- autoread = true, -- Reload files on change
-- history = 1000, -- More history
-- incsearch = true, -- Show partial matches for a search phrase
-- ruler = true, -- Show cursor position
-- softtabstop = 4, -- Tabs/Spaces interop
-- undolevels = 999, -- Lots of these
-- syntax enable      -- Turn on syntax highlighting

vim.opt.shortmess:append "c"

for k, v in pairs(options) do
    vim.opt[k] = v
end

vim.cmd "set whichwrap+=<,>,[,],h,l"
vim.cmd [[set iskeyword+=-]]
