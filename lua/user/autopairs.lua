local status_ok, npairs = pcall(require, "nvim-autopairs")
local cmp_status_ok, cmp = pcall(require, "cmp")

if not status_ok or not cmp_status_ok then
	return
end

local cmp_autop = require("nvim-autopairs.completion.cmp")

npairs.setup {
  check_ts = true,
  ts_config = {
    lua = { "string", "source" },
    javascript = { "string", "template_string" },
    java = false,
  },
  disable_filetype = { "TelescopePrompt"},
  fast_wrap = {
    map = "<M-e>",
    chars = { "{", "[", "(", '"', "'" },
    pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], "%s+", ""),
    offset = 0,
    end_key = "$",
    keys = "qwertyuiopzxcvbnmasdfghjkl",
    check_comma = true,
    highlight = "PmenuSel",
    highlight_grey = "LineNr",
  },
}

cmp.event:on("confirm_done", cmp_autop.on_confirm_done { map_char = { tex = "" } })
