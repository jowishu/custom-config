return {
  "MeanderingProgrammer/render-markdown.nvim",
  dependencies = {
    'nvim-treesitter/nvim-treesitter'
  },
  config = function()
    local render = require("render-markdown")
    render.setup({
      enabled = false,
      filetypes = {"markdown", "codecompanion"},
      -- 可渲染文件的最大大小, 单位 MB
      max_file_size = 10.0,
    })
  end
}
