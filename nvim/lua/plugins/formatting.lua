return {
  "stevearc/conform.nvim",
  event = {"BufReadPre", "BufNewFile"},
  config = function()
    local conform = require("conform")

    conform.setup({
      formatters = {
        black = {
          append_args = {'--line-length=110'},
        }
      },
      formatters_by_ft = {
        json = {"prettier"},
        rust = {"rustfmt", lsp_format = "fallback"},
        cpp = {"clang-format"},
        python = {"black"},
        tablegen = {"clang-format"},
        cmake = {"cmake_format"},
      },
      format_on_save = nil,
      -- log_level = vim.log.levels.DEBUG,
    })

    vim.keymap.set({"n", "v"}, "<C-f>",
      function()
        conform.format({lsp_fallback = true, async = false, timeout_ms = 1000})
      end,
      {desc = "Format file or range (in visual mode)"}
    )
  end
}
