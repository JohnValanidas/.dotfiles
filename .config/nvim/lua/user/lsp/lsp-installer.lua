local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
    vim.notify("can't find nvim-lsp-installer")
    return
end

-- Register handler that will be called for each and ever installed server

lsp_installer.on_server_ready(function(server)
    -- Refer to here for more insperation: https://youtu.be/6F3ONwrCxMg?t=1090
    local opts = {
        on_attach = require("user.lsp.handlers").on_attach,
        capabilities = require("user.lsp.handlers").capabilities,
    }

    -- customize servers here
    -- (optional) Customize the options passed to the servers
    if server.name == "jsonls" then
        local status_ok, schema_store = pcall(require, "schemastore")
        if status_ok then
            schemas = {
                init_options = {
                    provideFormatter = false,
                },
                settings = {
                    json = {
                        schemas = schema_store.json.schemas(),
                    },
                },
                setup = {
                    commands = {

                    },
                },
            }
            opts = vim.tbl_deep_extend("force", schemas, opts)
        else
            vim.notify("failed to load schemas for jsonls")
        end
    end

    if server.name == "sumneko_lua" then
        local sumneko_opts = require("user.lsp.settings.sumneko_lua")
        opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
    end



    -- if server.name == "tsserver" then
    --     opts.root_dir = function() ... end
    -- end
    

    -- This setup() function will take the provided server configuration and decorate it with the necessary properties
    -- before passing it onwards to lspconfig.
    -- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md 


    server:setup(opts)
end)

    
