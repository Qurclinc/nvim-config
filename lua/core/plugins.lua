local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup {
	{ 'hadronized/hop.nvim' },
	{ "nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
      		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
		"MunifTanjim/nui.nvim",
		}
	},
	{ 'nvim-treesitter/nvim-treesitter' },
	{ 'hrsh7th/nvim-cmp',                -- Основной плагин автодополнения
        dependencies = {
            'hrsh7th/cmp-nvim-lsp',        -- Источник LSP для nvim-cmp
            'neovim/nvim-lspconfig',       -- Настройка LSP
	     },
	},
	{ 'neovim/nvim-lspconfig' },
	{ 'folke/tokyonight.nvim',
	  lazy = false,
	  priority = 1000,
	  opts = {},
	},
    {'hrsh7th/cmp-nvim-lsp'}, {'hrsh7th/cmp-buffer'}, {'hrsh7th/cmp-path'},
    {'hrsh7th/cmp-cmdline'}, {'hrsh7th/nvim-cmp'}, {'lewis6991/gitsigns.nvim'},
    { 'williamboman/mason.nvim' },
    {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
     dependencies = { 'nvim-lua/plenary.nvim', "nvim-telescope/telescope-live-grep-args.nvim", 
     'BurntSushi/ripgrep' }
    },
    { 'jose-elias-alvarez/null-ls.nvim' },
    {
    'nvimdev/dashboard-nvim',
    event = 'VimEnter',
    config = function()
    require('dashboard').setup {
      -- config
    }
    end,
    dependencies = { {'nvim-tree/nvim-web-devicons'}}
    },
    {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    config = true
    -- use opts = {} for passing setup options
    -- this is equivalent to setup({}) function
    },
    {'windwp/nvim-ts-autotag'},
    {"akinsho/bufferline.nvim", dependencies = {'nvim-tree/nvim-web-devicons'}},
     {
        'nvim-lualine/lualine.nvim',
        dependencies = {
            'nvim-tree/nvim-web-devicons', 'linrongbin16/lsp-progress.nvim'
        }
    },
    {'akinsho/toggleterm.nvim', version = "*", config = true},
}
