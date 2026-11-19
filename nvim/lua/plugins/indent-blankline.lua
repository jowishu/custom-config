return {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  opts = {
    indent = {char = "¦"},
    scope = {show_start = false, show_end = false, show_exact_scope = false},
    exclude = {
      filetypes = {
        "help", "startify", "dashboard", "packer", "neogitstatus", "NvimTree",
        "Trouble"
      }
    }
  },
  config = function(_, opts)
    local hooks = require("ibl.hooks")
    hooks.register(hooks.type.WHITESPACE, hooks.builtin.hide_first_space_indent_level)
    require("ibl").setup(opts)
  end,
}
