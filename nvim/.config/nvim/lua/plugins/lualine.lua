return {
  -- the opts function can also be used to change the default opts:
  {
    'nvim-lualine/lualine.nvim',
    event = 'VeryLazy',
    opts = function(_, opts)
      table.remove(opts.sections.lualine_b)
    end,
  },
}
