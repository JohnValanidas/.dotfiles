local status_ok, mason = pcall(require, "mason")
if not status_ok then
    vim.notify("Mason failed to load")
    return
end

mason.setup()

require("user.lsp.lsp-installer")
-- require("user.lsp.handlers").setup()
