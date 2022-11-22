local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data").."/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  vim.cmd [[packadd packer.nvim]]
end

local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end
  }
}

return packer.startup(function(use)
  -- General plugins
  use {"lewis6991/impatient.nvim"}
  use {"wbthomason/packer.nvim"}
  use {"nvim-lua/popup.nvim"}
  use {"nvim-lua/plenary.nvim"}
  use {"nvim-telescope/telescope.nvim"}
  use {"nvim-lualine/lualine.nvim"}
  use {"kyazdani42/nvim-tree.lua"}
  use {"kyazdani42/nvim-web-devicons"}
  use {"numToStr/FTerm.nvim"}
  use {"goolord/alpha-nvim"}
  use {"akinsho/bufferline.nvim", tag = "v3.*"}
  use({
    "iamcco/markdown-preview.nvim",
    opt = true,
    ft = "markdown",
    run = function()
      vim.fn["mkdp#util#install"]()
    end,
  })
  -- Themes
  use {"https://gitlab.com/madyanov/gruber.vim", as = "gruber"}
  use "atelierbram/Base4Tone-nvim"
  -- AutoCompletion
  use {"hrsh7th/nvim-cmp", commit = "df6734aa018d6feb4d76ba6bda94b1aeac2b378a"}
  use {"hrsh7th/cmp-nvim-lsp"}
  use {"hrsh7th/cmp-buffer"}
  use {"hrsh7th/cmp-vsnip"}
  use {"hrsh7th/cmp-path"}
  -- Snippets
  use {"hrsh7th/vim-vsnip"}
  use {"rafamadriz/friendly-snippets"}
  -- Comments
  use {"numToStr/Comment.nvim"}
  use {"JoosepAlviste/nvim-ts-context-commentstring"}
  -- Tag close
  use {"windwp/nvim-autopairs"}
  use {"windwp/nvim-ts-autotag"}
  -- LSP Related
  use {"neovim/nvim-lspconfig"}
  use {"williamboman/mason.nvim"}
  use {"williamboman/mason-lspconfig.nvim"}
  use {
    "nvim-treesitter/nvim-treesitter",
    run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
    -- branch = "v0.8.0"
  }

  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
