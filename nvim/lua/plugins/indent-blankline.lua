return {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  opts = {
    indent = {
      char = "¦"
    },
    scope = {
      show_start = false,
      show_end = false,
      show_exact_scope = false
    },
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

    -- 第一级作用域高亮取消
    hooks.register(hooks.type.VIRTUAL_TEXT, function(_, _, _, virtual_text)
      local first = virtual_text[1]
      if first then
        for _, group in ipairs(first[2]) do
          if group:match("^@ibl%.scope%.char%.") then
            virtual_text[1] = { " " }
            break
          end
        end
      end
      return virtual_text
    end)
    require("ibl").setup(opts)
  end,
}
