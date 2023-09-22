local status_ok, mason_lspconfig = pcall(require, "mason-lspconfig")
if not status_ok then
    vim.notify("can't find mason-lspconfig")
    return
end

local status_ok, lspconfig = pcall(require, "lspconfig")
if not status_ok then
  vim.notify("can't find lspconifg")
return
end
-- Register handler that will be called for each and ever installed server

mason_lspconfig.setup {
  ensure_installed = { "lua_ls", "rust_analyzer", "tsserver", "pyright", "clangd", "bashls", "html", "cssls" }
}

local capabilties = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())


mason_lspconfig.setup_handlers({
  function(server_name) -- calls this function on every single installed lsp
    local opts = {
      capabilties = capabilties,
      on_attach = on_attach,
    }
    lspconfig[server_name].setup(opts)
  end,

  -- Change opts as desired
})
