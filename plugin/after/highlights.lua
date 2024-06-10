-- transparent background
vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })
vim.api.nvim_set_hl(0, 'FloatBorder', { bg = 'none' })
vim.api.nvim_set_hl(0, 'Pmenu', { bg = 'none' })
vim.api.nvim_set_hl(0, 'Terminal', { bg = 'none' })
vim.api.nvim_set_hl(0, 'EndOfBuffer', { bg = 'none' })
vim.api.nvim_set_hl(0, 'FoldColumn', { bg = 'none' })
vim.api.nvim_set_hl(0, 'Folded', { bg = 'none' })
vim.api.nvim_set_hl(0, 'SignColumn', { bg = 'none' })

-- transparent background for nvim-tree
vim.api.nvim_set_hl(0, 'NvimTreeNormal', { bg = 'none' })
vim.api.nvim_set_hl(0, 'NvimTreeVertSplit', { bg = 'none' })
vim.api.nvim_set_hl(0, 'NvimTreeEndOfBuffer', { bg = 'none' })

-- set hlsearch color
vim.api.nvim_set_hl(0, 'Search', { bg = '#8BCD5B', fg = '#202020' })
vim.api.nvim_set_hl(0, 'CurSearch', { bg = '#EFBD5D', fg = '#000000' })
vim.api.nvim_set_hl(0, 'IncSearch', { bg = '#F15664', fg = '#000000' })

-- set cursorline color
vim.api.nvim_set_hl(0, 'CursorLine', { bg = '#1A1A1F' })
vim.api.nvim_set_hl(0, 'CursorColumn', { bg = '#1A1A1F' })

-- set visual highlight
vim.api.nvim_set_hl(0, 'Visual', { bg = '#103070' })

