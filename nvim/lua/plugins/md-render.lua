return {
  "MeanderingProgrammer/render-markdown.nvim",
  dependencies = {
    'nvim-treesitter/nvim-treesitter',
    'nvim-tree/nvim-web-devicons',
  },
  config = function()
    require('render-markdown').setup({
      -- 默认不开启渲染
      enabled = false,
      render_modes = { 'n', 'c', 't' },
      preset = 'none',
      file_types = { 'markdown' },
      latex = {
        enabled = true,
        converter = { 'utftex', 'latex2text' },
        highlight = 'RenderMarkdownMath',
        position = 'center',
      }
    })
  end
}
