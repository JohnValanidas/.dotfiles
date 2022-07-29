local status_ok, auto_pairs = pcall(require, "nvim-autopairs")
if not status_ok then
    vim.notify("Could not load nvim-autopairs")
    return
end


auto_pairs.setup {
    check_ts = true,
    ts_config = {
        lua = {"string", "source"}
    },
    disable_filetype = { "TelescopePrompt" },
}


