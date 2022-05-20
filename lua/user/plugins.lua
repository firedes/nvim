local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

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
}

return packer.startup(function(use)
  use "wbthomason/packer.nvim"
  use "nvim-lua/plenary.nvim"
  use "nvim-lua/popup.nvim"

  use "rcarriga/nvim-notify"

  use "lunarvim/darkplus.nvim"
  use "kyazdani42/nvim-web-devicons"
  use "nvim-lualine/lualine.nvim"
  use "SmiteshP/nvim-gps"

  use "kyazdani42/nvim-tree.lua"
  use "akinsho/bufferline.nvim"
  use "matbme/JABS.nvim"

  use "lukas-reineke/indent-blankline.nvim"


  use "folke/which-key.nvim"
  use "akinsho/toggleterm.nvim"

  use "ggandor/lightspeed.nvim"
  use "numToStr/Comment.nvim"
  use "windwp/nvim-autopairs"
  use "windwp/nvim-spectre"
  use "AckslD/nvim-neoclip.lua"
  use "ThePrimeagen/harpoon"

  use "ahmedkhalf/project.nvim"

  -- cmp
  use {
    "hrsh7th/nvim-cmp",
    -- commit = "6527e5f31b8ced9e3ad186b6445925d4d91f15de",
  }
  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/cmp-buffer"
  use "hrsh7th/cmp-path"
  use "hrsh7th/cmp-cmdline"
  use "hrsh7th/cmp-nvim-lua"
  use {
    "tzachar/cmp-tabnine",
    run = "./install.sh",
    requires = "hrsh7th/nvim-cmp",
  }
  -- snippets
  use "saadparwaiz1/cmp_luasnip" -- cmp adapter for luasnip
  use "L3MON4D3/LuaSnip" -- snippet engine
  use "rafamadriz/friendly-snippets" -- a bunch of snippets to use

  -- LSP
  use "neovim/nvim-lspconfig"
  use "williamboman/nvim-lsp-installer"
  use "b0o/SchemaStore.nvim"
  use "ray-x/lsp_signature.nvim"
  use "jose-elias-alvarez/null-ls.nvim"
  use {
    "folke/trouble.nvim",
    cmd = "TroubleToggle",
  }
  use "simrat39/symbols-outline.nvim"
  -- use "filipdutescu/renamer.nvim"
  -- use "github/copilot.vim"
  use "RRethy/vim-illuminate"
  use "folke/todo-comments.nvim"
  -- Java
  -- use "mfussenegger/nvim-jdtls"


  -- Telescope
  use "nvim-telescope/telescope.nvim"
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
  -- use "nvim-telescope/telescope-media-files.nvim"

  -- Treesitter
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  }
  use "JoosepAlviste/nvim-ts-context-commentstring"
  use "p00f/nvim-ts-rainbow"
  use "windwp/nvim-ts-autotag"
  use "mizlan/iswap.nvim"

  -- Git
  use "lewis6991/gitsigns.nvim"
  use "f-person/git-blame.nvim"
  -- use "ruifm/gitlinker.nvim"
end)
