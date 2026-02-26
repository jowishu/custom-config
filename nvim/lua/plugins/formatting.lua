return {
  "stevearc/conform.nvim",
  event = {"BufReadPre", "BufNewFile"},
  config = function()
    local conform = require("conform")

    conform.setup({
      formatters_by_ft = {
        json = {"prettier"},
        rust = {"rustfmt", lsp_format = "fallback"},
        cpp = {"clang-format"},
        python = {"ruff_format"},
        tablegen = {"clang-format"},
        cmake = {"gersemi"},
      },
      format_on_save = nil
    })

    vim.keymap.set({"n", "v"}, "<C-f>", function()
      conform.format({lsp_fallback = true, async = false, timeout_ms = 1000})
    end, {desc = "Format file or range (in visual mode)"})
  end
}
