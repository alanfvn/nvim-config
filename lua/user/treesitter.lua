local status_ok, configs = pcall(require, "nvim-treesitter.configs")

if not status_ok then
  return
end

configs.setup({
  ensure_installed = "all",
  ignore_install = { "" },
  highlight = {
    enable = true,
    additional_vim_regex_higlighting = false,
  },
  indent = {
    enable = true,
  },
  autopairs = {
    enable = true,
  },
  autotag = {
    enable = true,
  },
  context_commentstring = {
    enable = true
  },
})
