return {
  "akinsho/bufferline.nvim",
  config = function()
    require("bufferline").setup {
      options = {
        always_show_bufferline = false
      }
    }
  end,
}
