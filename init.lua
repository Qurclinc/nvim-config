-- Base config
require('core.plugins')
require('core.mappings')
require('core.colors')
require('core.configs')

-- Plugins
require('plugins.neotree')
require('plugins.treesitter')
require('plugins.lsp')
require('plugins.cmp')
require('plugins.mason')
require('plugins.telescope')
-- require('plugins.nullls')
require('plugins.dashboard')
require('plugins.autopairs')
require('plugins.autotag')
require('plugins.buffline')
require('plugins.lualine')
require('plugins.toggleterm')


-- Extend config

-- if vim.fn.has('unix') == 1 then
--  vim.opt.clipboard = 'unnamedplus'
-- end

