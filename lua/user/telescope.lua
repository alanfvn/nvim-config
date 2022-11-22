local status_ok, telescope = pcall(require, "telescope")

if not status_ok then
  return
end

telescope.setup{
  pickers = {
    buffers = {
      initial_mode = "normal"
    },
    find_files = {
      initial_mode = "normal"
    }
  },
  defaults = {
    prompt_prefix = " ",
    selection_caret = " ",
    path_display = { "smart" },
    file_ignore_patterns = {
      "node_modules",
      "build",
      ".git\\",
      "env\\",
      ".git/",
    }
  }
}
