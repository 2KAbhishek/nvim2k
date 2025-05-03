local textobjects = {
    select = {
        enable = true,
        lookahead = true,

        keymaps = {
            ['a='] = { query = '@assignment.outer', desc = 'Select outer part of an assignment' },
            ['i='] = { query = '@assignment.inner', desc = 'Select inner part of an assignment' },
            ['al='] = { query = '@assignment.lhs', desc = 'Select left hand side of an assignment' },
            ['ar='] = {
                query = '@assignment.rhs',
                desc = 'Select right hand side of an assignment',
            },

            ['a:'] = { query = '@property.outer', desc = 'Select outer part of an object property' },
            ['i:'] = { query = '@property.inner', desc = 'Select inner part of an object property' },
            ['l:'] = { query = '@property.lhs', desc = 'Select left part of an object property' },
            ['r:'] = { query = '@property.rhs', desc = 'Select right part of an object property' },

            ['aa'] = {
                query = '@parameter.outer',
                desc = 'Select outer part of a parameter/argument',
            },
            ['ia'] = {
                query = '@parameter.inner',
                desc = 'Select inner part of a parameter/argument',
            },

            ['ai'] = { query = '@conditional.outer', desc = 'Select outer part of a conditional' },
            ['ii'] = { query = '@conditional.inner', desc = 'Select inner part of a conditional' },

            ['al'] = { query = '@loop.outer', desc = 'Select outer part of a loop' },
            ['il'] = { query = '@loop.inner', desc = 'Select inner part of a loop' },

            ['af'] = { query = '@call.outer', desc = 'Select outer part of a function call' },
            ['if'] = { query = '@call.inner', desc = 'Select inner part of a function call' },

            ['am'] = {
                query = '@function.outer',
                desc = 'Select outer part of a method/function definition',
            },
            ['im'] = {
                query = '@function.inner',
                desc = 'Select inner part of a method/function definition',
            },

            ['ac'] = { query = '@class.outer', desc = 'Select outer part of a class' },
            ['ic'] = { query = '@class.inner', desc = 'Select inner part of a class' },
        },
    },
    swap = {
        enable = true,
        swap_next = {
            ['<leader>rna'] = '@parameter.inner', -- swap object property with next
            ['<leader>rn:'] = '@property.outer', -- swap parameters/argument with next
            ['<leader>rnm'] = '@function.outer', -- swap function with next
        },
        swap_previous = {
            ['<leader>rpa'] = '@parameter.inner', -- swap parameters/argument with prev
            ['<leader>rp:'] = '@property.outer', -- swap object property with prev
            ['<leader>rpm'] = '@function.outer', -- swap function with previous
        },
    },
    move = {
        enable = true,
        set_jumps = true, -- whether to set jumps in the jumplist
        goto_previous_start = {
            ['[oc'] = { query = '@class.outer', desc = 'Prev class start' },
            ['[of'] = { query = '@call.outer', desc = 'Prev function call start' },
            ['[oi'] = { query = '@conditional.outer', desc = 'Prev conditional start' },
            ['[ol'] = { query = '@loop.outer', desc = 'Prev loop start' },
            ['[om'] = { query = '@function.outer', desc = 'Prev method def start' },
            ['[z'] = { query = '@fold', query_group = 'folds', desc = 'Prev fold' },
            -- You can pass a query group to use query from `queries/<lang>/<query_group>.scm file in your runtime path.
            -- Above example nvim-treesitter's folds.scm`. They also provide locals.scm, highlights.scm and indent.scm.
        },
        goto_previous_end = {
            ['[oC'] = { query = '@class.outer', desc = 'Prev class end' },
            ['[oF'] = { query = '@call.outer', desc = 'Prev function call end' },
            ['[oI'] = { query = '@conditional.outer', desc = 'Prev conditional end' },
            ['[oL'] = { query = '@loop.outer', desc = 'Prev loop end' },
            ['[oM'] = { query = '@function.outer', desc = 'Prev method def end' },
            ['[Z'] = { query = '@fold', query_group = 'folds', desc = 'Prev fold end' },
        },
        goto_next_start = {
            [']oc'] = { query = '@class.outer', desc = 'Next class start' },
            [']of'] = { query = '@call.outer', desc = 'Next function call start' },
            [']oi'] = { query = '@conditional.outer', desc = 'Next conditional start' },
            [']ol'] = { query = '@loop.outer', desc = 'Next loop start' },
            [']om'] = { query = '@function.outer', desc = 'Next method def start' },
            [']z'] = { query = '@fold', query_group = 'folds', desc = 'Next fold' },
        },
        goto_next_end = {
            [']oC'] = { query = '@class.outer', desc = 'Next class end' },
            [']oF'] = { query = '@call.outer', desc = 'Next function call end' },
            [']oI'] = { query = '@conditional.outer', desc = 'Next conditional end' },
            [']oL'] = { query = '@loop.outer', desc = 'Next loop end' },
            [']oM'] = { query = '@function.outer', desc = 'Next method def end' },
            [']Z'] = { query = '@fold', query_group = 'folds', desc = 'Next fold end' },
        },
    },
}

local ts_repeat_move = require('nvim-treesitter.textobjects.repeatable_move')

-- vim way: ; goes to the direction you were moving.
vim.keymap.set({ 'n', 'x', 'o' }, ';', ts_repeat_move.repeat_last_move)
vim.keymap.set({ 'n', 'x', 'o' }, ',', ts_repeat_move.repeat_last_move_opposite)

-- Optionally, make builtin f, F, t, T also repeatable with ; and ,
vim.keymap.set({ 'n', 'x', 'o' }, 'f', ts_repeat_move.builtin_f)
vim.keymap.set({ 'n', 'x', 'o' }, 'F', ts_repeat_move.builtin_F)
vim.keymap.set({ 'n', 'x', 'o' }, 't', ts_repeat_move.builtin_t)
vim.keymap.set({ 'n', 'x', 'o' }, 'T', ts_repeat_move.builtin_T)

return textobjects
