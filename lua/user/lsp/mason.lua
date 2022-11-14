local mason_ok, mason = pcall(require, "mason")
local mason_config_ok, mason_config = pcall(require, "mason-lspconfig")
local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")

if not mason_ok or not mason_config_ok then
  return
end


local servers = {
  "cssls",
  "emmet_ls",
  "jsonls",
  "pyright",
  "sumneko_lua",
  "tsserver",
  "dockerls"
}

mason.setup({
	ui = {
		border = "none",
		icons = {
			package_installed = "◍",
			package_pending = "◍",
			package_uninstalled = "◍",
		},
	},
	log_level = vim.log.levels.INFO,
	max_concurrent_installers = 4,
})

mason_config.setup({
	ensure_installed = servers,
	automatic_installation = true,
})

if not lspconfig_status_ok then
	return
end

for _, server in pairs(servers) do
  local	opts = {
		on_attach = require("user.lsp.handlers").on_attach,
		capabilities = require("user.lsp.handlers").capabilities,
	}
	server = vim.split(server, "@")[1]
	local require_ok, conf_opts = pcall(require, "user.lsp.settings." .. server)
	if require_ok then
		opts = vim.tbl_deep_extend("force", conf_opts, opts)
	end
	lspconfig[server].setup(opts)
end
