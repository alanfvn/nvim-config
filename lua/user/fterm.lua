local status_ok, fterm = pcall(require, 'FTerm')

if not status_ok then
  return
end

fterm.setup({
  ft = 'FTerm',
  cmd = "powershell",
  border = 'single',
  auto_close = true,
  hl = 'Normal',
  blend = 0,
  dimensions = {
    height = 0.8, -- Height of the terminal window
    width = 0.8, -- Width of the terminal window
    x = 0.5, -- X axis of the terminal window
    y = 0.5, -- Y axis of the terminal window
  },
  on_exit = nil,
  on_stdout = nil,
  on_stderr = nil,
})

