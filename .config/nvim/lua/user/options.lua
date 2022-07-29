vim.opt.backup = false                          -- Backup setting
vim.opt.cmdheight = 2                           -- more space in the neovim command line for displaying messages
vim.opt.completeopt = { "menuone", "noselect"}   -- CMP option
vim.opt.conceallevel = 0                        -- So that `` is visible in markdown files
vim.opt.fileencoding = "utf-8"
vim.opt.mouse = "a"                             -- enable mouse
vim.opt.pumheight = 10                          -- popup menu height
vim.opt.clipboard = "unnamedplus"

vim.opt.termguicolors = true

-- Pulled from old config
vim.opt.wildmenu = true
-- vim.opt.wildmode = "list:longest"
-- we never want to edit these files
vim.opt.wildignore = {"*.docx", "*.jpg", "*.png", "*.gif", "*.pdf", "*.pyc", "*.exe", "*.flv", "*.img", "*.xlsx"}

vim.opt.number = true
vim.opt.cursorline = true
vim.opt.cursorcolumn = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 5
vim.opt.expandtab = true
vim.opt.scrolloff = 10
vim.opt.wrap = false
-- Searching options
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.showcmd = true
vim.opt.showmatch = true
vim.opt.hlsearch = true
--History options
vim.opt.history = 2000



-- Color options
--vim.opt.colorsceme = "nightfox"
