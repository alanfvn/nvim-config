local status_ok, lualine = pcall(require, "lualine")

if not status_ok then
  return
end


lualine.setup({
  options = {
    icons_enabled = true,
    theme = "auto",
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = { "alpha", "dashboard", "NvimTree", "Outline" },
    always_divide_middle = true,
  },
  sections = {
    lualine_a = {
      -- diagnostics
      {
        "branch",
        icons_enabled = true,
        icon = "",
      },
      {
        "diagnostics",
        sources = { "nvim_diagnostic" },
        sections = { "error", "warn" },
        symbols = { error = " ", warn = " " },
        colored = false,
        update_in_insert = false,
        always_visible = true,
      }
    },
    lualine_b = {
      -- mode
      {
        "mode",
        fmt = function(str)
          return str
        end,
      }
    },
    lualine_c = {},
    lualine_y = {
      -- location
      {
        "location",
        padding = 0,
      }
    },
    lualine_z = {
      -- progress
      function ()
        return vim.fn.line(".") .. ":" ..vim.fn.line("$")
      end
    },
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { "filename" },
    lualine_x = { "location" },
    lualine_y = {},
    lualine_z = {},
  },
  tabline = {},
  extensions = {},
})
