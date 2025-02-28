-- Создаем группу подсветки для ASCII-арта
vim.api.nvim_set_hl(0, 'HeaderHighlight', { fg = '#ff5733', bold = true })

local function default_header()
    return {
        '', '', '',
        ' ██████╗██╗  ██╗██████╗ ███████╗██████╗ ',
        '██╔════╝╚██╗██╔╝██╔══██╗██╔════╝██╔══██╗',
        '██║      ╚███╔╝ ██║  ██║█████╗  ██████╔╝',
        '██║      ██╔██╗ ██║  ██║██╔══╝  ██╔══██╗',
        '╚██████╗██╔╝ ██╗██████╔╝███████╗██║  ██║',
        '', '', ''
    }
end

-- Настройка плагина Dashboard
require('dashboard').setup {
    theme = 'doom',
    config = {
        header = default_header(),
        center = {
            {
                icon = '󰙅 ',
                icon_hl = 'Title',
                desc = 'Open tree',
                desc_hl = 'String',
                key = 'e',
                keymap = 'SPC e',
                key_hl = 'Number',
                action = ':Neotree float'
            }, {
                icon = '󰈞 ',
                icon_hl = 'Title',
                desc = 'Find files',
                desc_hl = 'String',
                key = 'f',
                keymap = 'SPC f f',
                key_hl = 'Number',
                action = ':Telescope find_files'
            }, {
                icon = ' ',
                icon_hl = 'Title',
                desc = 'Find text',
                desc_hl = 'String',
                key = 'w',
                keymap = 'SPC f w',
                key_hl = 'Number',
                action = ':Telescope live_grep'
            }, {
                icon = ' ',
                icon_hl = 'Title',
                desc = 'Git Braches',
                desc_hl = 'String',
                key = 'b',
                keymap = 'SPC g b',
                key_hl = 'Number',
                action = ':Telescope git_branches'
            }
        },
        footer = {}
    }
}

-- Автокоманда для применения подсветки после загрузки Dashboard
vim.api.nvim_create_autocmd('User', {
    pattern = 'DashboardReady',
    callback = function()
        local header_lines = default_header()
        local bufnr = vim.api.nvim_get_current_buf()  -- Получаем номер текущего буфера
        for i, _ in ipairs(header_lines) do
            vim.api.nvim_buf_add_highlight(bufnr, -1, 'HeaderHighlight', i, 0, -1)
        end
    end,
})

