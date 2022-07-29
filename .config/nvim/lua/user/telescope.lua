local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
    vim.notify("Failed to load telescope")
    return
end



telescope.setup {}

