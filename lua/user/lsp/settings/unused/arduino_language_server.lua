local my_fqbn = "esp8266:esp8266:generic"

return {
  cmd = {
    "arduino-language-server",
    "-cli", "C:/Apps/arduino-cli_0.24.0_Windows_64bit/arduino-cli.exe",
    "-cli-config", "~/AppData/Local/Arduino15/arduino-cli.yaml",
    "-clangd", vim.fn.expand("~/AppData/Local/nvim-data/mason/packages/clangd/clangd/bin/clangd.exe"),
    "-fqbn", my_fqbn,
    "-log",
  }
}
