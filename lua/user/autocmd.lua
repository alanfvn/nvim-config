local colorPath = vim.fn.stdpath("config").."/lua/user/colorscheme.lua";
local loop = vim.loop

vim.cmd [[
augroup packer_user_config
autocmd!
autocmd BufWritePost plugins.lua source <afile> | PackerSync
augroup end
]]

vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
	callback = function()
		vim.cmd("set formatoptions-=cro")
    vim.cmd("normal zR")
	end,
})

vim.api.nvim_create_autocmd({"ColorScheme"}, {
  callback = function ()
    loop.fs_open(colorPath, "w", 432,
      function (_, fd)
        loop.fs_write(
          fd,
          "pcall(vim.cmd, \"colorscheme "..(vim.g.colors_name or "default").."\")",
          nil,
          function()
            loop.fs_close(fd)
          end
        )
      end)
  end
})
