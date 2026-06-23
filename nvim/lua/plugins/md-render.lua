return {
  "MeanderingProgrammer/render-markdown.nvim",
  dependencies = {
    'nvim-treesitter/nvim-treesitter',
    'nvim-tree/nvim-web-devicons',
  },
  config = function()
    require('render-markdown').setup({
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
-- return {
--   "OXY2DEV/markview.nvim",
--   dependencies = {
--     "nvim-treesitter/nvim-treesitter",
--     "nvim-tree/nvim-web-devicons"
--   },
--   config = function()
--     require("markview").setup({
--       modes = { "n", "i", "no", "c" },
--       hybrid_modes = { "i" },
--       preview = {
--         enable = false,
--       },
--       callbacks = {
--         on_enable = function(_, win)
--           vim.wo[win].conceallevel = 2
--           vim.wo[win].concealcursor = "nc"
--         end,
--       },
--     })
--   end
-- }
