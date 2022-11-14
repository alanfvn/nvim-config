return {
  settings = {
    Lua = {
      -- Version of Lua used
      runtime = { version = 'LuaJIT' },
      -- Get the language server to recognize the `vim` global
      diagnostics = { globals = { 'vim' } },
      -- Make the server aware of Neovim runtime files
      workspace = {
        library = {
          [vim.fn.expand('$VIMRUNTIME/lua')] = true,
          [vim.fn.stdpath('config') .. '/lua'] = true,
        },
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = { enable = false },
    },
  },
}
