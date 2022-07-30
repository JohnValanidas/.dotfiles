local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSRAP = fn.system {
      "git",
      "clone",
      "--depth",
      "1",
      "https://github.com/wbthomason/packer.nvim",
      install_path,
    }

    print "installing packer close and reopen Neovim..."
    vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
    augroup packer_user_config
        autocmd!
        autocmd BufWritePost plugins.lua source <afile> | PackerSync
    augroup end
]]

-- use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then

    return
end

-- have packer use a popip window
packer.init {
    display = {
        open_fn = function()
            return require("packer.util").float { border = "rounded" }
        end,
    },
}

-- Install plugins here
return packer.startup(function(use)
    -- 
    use "wbthomason/packer.nvim" -- have nvim manange itself
    use "nvim-lua/popup.nvim" -- an implementation of the Popup API from Vim in Neovim
    use "nvim-lua/plenary.nvim" -- Useful lua functions     

    -- General plugins
    use "windwp/nvim-autopairs"
    use "numToStr/Comment.nvim"

    -- Style
    use "EdenEast/nightfox.nvim"
    use "kyazdani42/nvim-web-devicons"

    -- Nvim Tree
    use "kyazdani42/nvim-tree.lua"

    -- Completions
    use "hrsh7th/nvim-cmp" -- The completion plugin 
    use "hrsh7th/cmp-buffer" -- buffer completion
    use "hrsh7th/cmp-path" -- path completion
    use "hrsh7th/cmp-cmdline" -- cmdline completion
    use "saadparwaiz1/cmp_luasnip" -- snippet completions
    use "hrsh7th/cmp-nvim-lsp" -- lsp completions
    use "hrsh7th/cmp-nvim-lua" -- lua completions
    use "David-Kunz/cmp-npm" -- npm completions in package.json

    -- Snippets
    use "L3MON4D3/LuaSnip" -- snippet engine
    use "rafamadriz/friendly-snippets" -- a bunch of snippets to use

    -- LSP
    use "neovim/nvim-lspconfig" -- enable LSP
    use "williamboman/nvim-lsp-installer" -- language server installer

    -- LSP support plugins
    use "b0o/schemastore.nvim"

    -- Telescope
    use { "nvim-telescope/telescope.nvim", tag = '0.1.0' }
    -- use "nvim-telescope/telescope-media-files.nvim" -- display images inside telescope preview

    -- Treesitter
    use { "nvim-treesitter/nvim-treesitter", run=":TSUpdate" }
    use "p00f/nvim-ts-rainbow"
    use "JoosepAlviste/nvim-ts-context-commentstring"

    -- Git
    use "lewis6991/gitsigns.nvim"

    -- Bufferline
    use "akinsho/bufferline.nvim"
    use "moll/vim-bbye"

    -- Automatically set up your configuration after calling packer.nvim
    -- MUST GO AT THE END
    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)
