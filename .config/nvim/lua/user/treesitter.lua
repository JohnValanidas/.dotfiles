local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
    vim.notify("failed to load nvim-treesitter")
    return
end

configs.setup {
    ensure_installed = {"lua", "rust", "typescript", "javascript", "tsx", "python"},
    sync_install = false,
    ignore_install = {},
    highlight = {
        enable = true,
        disable = { "" },
        additional_vim_regex_highlighting = true,
    },
    indent = { enable = true, disable = { "yaml" } },

  context_commentstring = {
    enable = true,
    enable_autocmd = false,
  },

    rainbow = {
        enable = true,
        -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
        extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
        max_file_lines = nil, -- Do not enable for files with more than n lines, int
        -- colors = {}, -- table of hex strings
        -- termcolors = {} -- table of colour name strings
    }
}
