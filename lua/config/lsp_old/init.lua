local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
    return
end


require "config.lsp_old.mason"
require("config.lsp_old.handlers").setup()
