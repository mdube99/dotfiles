return {
    -- Git related plugins
    'tpope/vim-fugitive',
    -- Detect tabstop and shiftwidth automatically
    'tpope/vim-sleuth',
    {
        'kylechui/nvim-surround',
        version = "*",
        event = "VeryLazy",
        config = function()
            require("nvim-surround").setup()
        end,
    },
    -- vscode snippets
    { "rafamadriz/friendly-snippets",
        config = function()
            require("luasnip.loaders.from_vscode").lazy_load()
        end,
    },
    -- NOTE: This is where your plugins related to LSP can be installed.
    --  The configuration is done below. Search for lspconfig to find it below.
    { -- LSP Configuration & Plugins
        'neovim/nvim-lspconfig',
        dependencies = {
            -- Automatically install LSPs to stdpath for neovim
            'williamboman/mason.nvim',
            'williamboman/mason-lspconfig.nvim',

            -- Useful status updates for LSP
            -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
            -- { 'j-hui/fidget.nvim', opts = {} },

            -- Additional lua configuration, makes nvim stuff amazing!
            'folke/neodev.nvim',
        },
    },
    {
        "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup {} end,
    },
    { -- Autocompletion
        'hrsh7th/nvim-cmp',
        dependencies = { 'hrsh7th/cmp-nvim-lsp', 'L3MON4D3/LuaSnip', 'saadparwaiz1/cmp_luasnip' },
    },
    -- Useful plugin to show you pending keybinds.
    { 'folke/which-key.nvim',          opts = {} },
    { -- Adds git releated signs to the gutter, as well as utilities for managing changes
        'lewis6991/gitsigns.nvim',
        opts = {
            signs = {
                add          = { text = '+' },
                change       = { text = '~' },
                delete       = { text = '_' },
                topdelete    = { text = '‾' },
                changedelete = { text = '~' },
                untracked    = { text = '│' },
            },
        },
    },
    {
        'lukas-reineke/indent-blankline.nvim',
        opts = {
            -- char = '┊',
            char = "▏",
            show_trailing_blankline_indent = false,
        },
    },
    -- "gc" to comment visual regions/lines
    { 'numToStr/Comment.nvim',         opts = {} },
    -- Fuzzy Finder (files, lsp, etc)
    { 'nvim-telescope/telescope.nvim', version = '*', dependencies = { 'nvim-lua/plenary.nvim' } },
    -- Fuzzy Finder Algorithm which requires local dependencies to be built.
    -- Only load if `make` is available. Make sure you have the system
    -- requirements installed.
    {
        'nvim-telescope/telescope-fzf-native.nvim',
        -- NOTE: If you are having trouble with this installation,
        --       refer to the README for telescope-fzf-native for more instructions.
        build = 'make',
        cond = function()
            return vim.fn.executable 'make' == 1
        end,
    },
    { -- Highlight, edit, and navigate code
        'nvim-treesitter/nvim-treesitter',
        dependencies = {
            'nvim-treesitter/nvim-treesitter-textobjects',
        },
        config = function()
            pcall(require('nvim-treesitter.install').update { with_sync = true })
        end,
    },
    -- { "LunarVim/darkplus.nvim",
    --     priority = 1000,
    --     config = function()
    --         vim.cmd.colorscheme "darkplus"
    --     end,
    -- },
    {
        "sainnhe/gruvbox-material",
        priority = 1000,
        -- config = function()
        --     vim.cmd.colorscheme "gruvbox-material"
        -- end,
    },
    {
        "tiagovla/tokyodark.nvim",
        config = function()
            vim.cmd.colorscheme "tokyodark"
        end,
    },
    {
        "ray-x/lsp_signature.nvim",
        config = function()
            require("lsp_signature").setup()
        end,
    },
    {
        "lambdalisue/suda.vim",
        cmd = "SudaWrite",
    },
    {
        "utilyre/barbecue.nvim",
        name = "barbecue",
        version = "*",
        dependencies = {
            "SmiteshP/nvim-navic",
            "nvim-tree/nvim-web-devicons", -- optional dependency
        },
        opts = {
            -- configurations go here
            show_basename = true, -- won't show filename, since bufferline is doing this
        },
    },
    {
        "iamcco/markdown-preview.nvim",
        ft = "markdown",
        -- build = "cd app && yarn install",
        build = ":call mkdp#util#install()",
    },
}
