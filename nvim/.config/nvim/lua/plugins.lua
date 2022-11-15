-- Automatically install packer
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
  git = {
    clone_timeout = 300, -- Timeout, in seconds, for git clones
  },
}


-- Install your plugins here
return packer.startup(function(use)
  -- Packer
  use { "wbthomason/packer.nvim" }

  -- Plenary
  use { "nvim-lua/plenary.nvim", commit = "4b7e52044bbb84242158d977a50c4cbcd85070c7" }                -- Useful lua functions used by lots of plugins

  -- Colorscheme
  use { "ellisonleao/gruvbox.nvim", commit = "24f9e795bfac5fabbaba703116e747dcf2ad8d2f" }

  -- Tmux & split window navigation
  use {"christoomey/vim-tmux-navigator" }

  -- Vim surround
  use { "tpope/vim-surround" }

  -- Vim repace with register
  use { "vim-scripts/ReplaceWithRegister" }

  -- Comment
  use { "numToStr/Comment.nvim", commit = "97a188a98b5a3a6f9b1b850799ac078faa17ab67" }

  -- Smoothie scroll
  use { "karb94/neoscroll.nvim" }

  -- Nvim Tree
  use { "nvim-tree/nvim-tree.lua" }
  -- Icons
  use { "kyazdani42/nvim-web-devicons" }

  -- Status bar
  use { "nvim-lualine/lualine.nvim" }

  -- Indent blankline
  use { "lukas-reineke/indent-blankline.nvim" }

  -- Telescope
  use { "nvim-telescope/telescope.nvim", branch = "0.1.x" }               -- fuzzy finder over lists

  -- Autocompletion
  use { "hrsh7th/nvim-cmp" }                     -- Plugin for autocompletion, CMP = Completion
  use { "saadparwaiz1/cmp_luasnip" }             -- Shows us snippets in autocompletions
  use { "hrsh7th/cmp-buffer" }                   -- CMP Extension: Recommend text from the current buffer
  use { "hrsh7th/cmp-path" }                     -- CMP Extension: Path completions
  use { "hrsh7th/cmp-nvim-lua" }                 -- CMP Extension: Path completions
  use { "andersevenrud/cmp-tmux" }               -- CMP Extension: Path completions
  use { "tamago324/cmp-zsh" }                    -- CMP Extension: Path completions

  -- Snippets
  use { "L3MON4D3/LuaSnip" }                     -- Snippet engine
  use { "rafamadriz/friendly-snippets" }         -- A bunch of snippets to use

  -- Managing & Installing LSP Servers
  use { "williamboman/mason.nvim" }
  use { "williamboman/mason-lspconfig.nvim" }    -- Bridge the gap between MASON and LSP

  -- LSP
  use { "neovim/nvim-lspconfig" }                 -- Enable LSP
  use { "hrsh7th/cmp-nvim-lsp" }                  -- LSP will appear in CMP completion
  use { "glepnir/lspsaga.nvim", branch = "main" } -- A lightweight LSP plugin with a highly performant UI
  use { "onsails/lspkind.nvim" }                  -- Plugin adds vscode-like pictograms to neovim built-in lsp

  -- NULL-LS
  use { "jose-elias-alvarez/null-ls.nvim" }       -- Use to configure formatters and linters
  use { "jayp0521/mason-null-ls.nvim" }           -- Use to install formatters and linters

  -- Treesitter
  use { "nvim-treesitter/nvim-treesitter", run = function() require("nvim-treesitter.install").update({ with_sync = true }) end }

  -- Autopairs
  use { "windwp/nvim-autopairs" }                -- Autopairs, integrates with both cmp and treesitter
  use { "windwp/nvim-ts-autotag" }

  -- Gitsigns
  use { "lewis6991/gitsigns.nvim" }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require("packer").sync()
  end
end)
