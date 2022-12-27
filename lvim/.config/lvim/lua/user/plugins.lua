    lvim.plugins = {
    { "abzcoding/tokyonight.nvim" },
    { "ray-x/lsp_signature.nvim",
        config = function()
        require("user.lsp_signature").config()
        end,
        event = "BufRead",
    },
    {
    "vimwiki/vimwiki",
      -- ft = {"markdown"},
    },
      "iamcco/markdown-preview.nvim",
    { "lukas-reineke/indent-blankline.nvim",
        config = function()
            require "user.blankline"
        end,
    },
    { "tpope/vim-fugitive" },
    { "tpope/vim-surround" },
    { "lambdalisue/suda.vim" },
        cmd = "SudaWrite",
    {
    "karb94/neoscroll.nvim",
    config = function()
        require("user.neoscroll").config()
    end,
    },

    {
    "norcalli/nvim-colorizer.lua",
    config = function()
      require("user.colorizer").config()
    end,
    },
    {
    "folke/todo-comments.nvim",
    requires = "nvim-lua/plenary.nvim",
    config = function()
        require("user.todo_comments").config()
    end,
    event = "BufRead",
    },
    {
      "RishabhRD/nvim-cheat.sh",
      requires = "RishabhRD/popfix",
      config = function()
        vim.g.cheat_default_window_layout = "vertical_split"
      end,
      opt = true,
      cmd = { "Cheat", "CheatWithoutComments", "CheatList", "CheatListWithoutComments" },
    },
}
