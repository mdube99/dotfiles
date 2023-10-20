return {
  -- Git related plugins
  'tpope/vim-fugitive',
  -- Detect tabstop and shiftwidth automatically
  'tpope/vim-sleuth',
  -- vscode snippets
  {
    'rafamadriz/friendly-snippets',
    config = function()
      require('luasnip.loaders.from_vscode').lazy_load()
    end,
  },
  {
    'lukas-reineke/indent-blankline.nvim',
    opts = {
      indent = {
        char = '│',
        tab_char = '│',
      },
      scope = { enabled = false },
      exclude = {
        filetypes = {
          'help',
          'alpha',
          'dashboard',
          'neo-tree',
          'Trouble',
          'lazy',
          'mason',
          'notify',
          'toggleterm',
          'lazyterm',
        },
      },
    },
    main = 'ibl',
  },
  {
    'LunarVim/darkplus.nvim',
    priority = 1000,
    config = function()
      vim.cmd.colorscheme 'darkplus'
    end,
  },
  -- {
  --     "sainnhe/gruvbox-material",
  --     priority = 1000,
  --     config = function()
  --         vim.cmd.colorscheme "gruvbox-material"
  --     end,
  -- },
  {
    'lambdalisue/suda.vim',
    cmd = 'SudaWrite',
  },
  { 'folke/flash.nvim', enabled = false },
}
