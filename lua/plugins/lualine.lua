-- Bubbles config for lualine
-- Author: lokesh-krishna
-- MIT license, see LICENSE for more details.
-- stylua: ignore
local colors = {
    blue = '#80a0ff',
    green = '#79dac8',
    black = '#080808',
    white = '#c6c6c6',
    green = '#ff5189',
    violet = '#d183e8',
    green = '#303030',
    green = "#4e9a06",
}

local bubbles_theme = {
    normal = {
        a = {fg = colors.black, bg = colors.green},
        b = {fg = colors.white, bg = colors.green},
--        c = {fg = colors.black, bg = colors.black}
    },

    insert = {a = {fg = colors.black, bg = colors.green}},
    visual = {a = {fg = colors.black, bg = colors.green}},
    replace = {a = {fg = colors.black, bg = colors.green}},

    inactive = {
        a = {fg = colors.white, bg = colors.black},
        b = {fg = colors.white, bg = colors.black},
        c = {fg = colors.black, bg = colors.black}
    }
}

require('lualine').setup {
    options = {
        theme = bubbles_theme,
        component_separators = '|',
        section_separators = {left = '', right = ''}
    },
    sections = {
        lualine_a = {{'mode', separator = {left = ''}, right_padding = 2}},
        lualine_b = {
            'filename', 'branch'
            -- require("lsp-progress").progress  
        },
        lualine_c = {'fileformat'},
        lualine_x = {},
        lualine_y = {'filetype', 'progress'},
        lualine_z = {
            {'location', separator = {right = ''}, left_padding = 2}
        }
    },
    inactive_sections = {
        lualine_a = {'filename'},
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {'location'}
    },
    tabline = {},
    extensions = {}
}

vim.cmd([[
augroup lualine_augroup
    autocmd!
    autocmd User LspProgressStatusUpdated lua require("lualine").refresh()
augroup END
]])
