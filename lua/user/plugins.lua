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
  -- temp stuff
  use "nvim-treesitter/playground"
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
  use({
    "iamcco/markdown-preview.nvim",
    opt = true,
    ft = "markdown",
    run = function()
      vim.fn["mkdp#util#install"]()
    end,
  })
  -- Themes
  use "RRethy/nvim-base16"
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
  use { "nvim-treesitter/nvim-treesitter" }

  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
