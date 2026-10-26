-- Custom code snippets for different purposes
-- Prevent LSP from overwriting treesitter color settings
-- https://github.com/NvChad/NvChad/issues/1907
-- Or any number lower than 100, treesitter's priority level
vim.hl.priorities.semantic_tokens = 95

-- Appearance of diagnostics
vim.diagnostic.config({
  virtual_text = {
    prefix = "●",
    -- Add a custom format function to show error codes
    format = function(diagnostic)
      if diagnostic.code ~= nil then
        return string.format("[%s] %s", tostring(diagnostic.code), diagnostic.message)
      end
      return diagnostic.message
    end
  },
  underline = false,
  update_in_insert = true,
  float = {
    source = "always" -- Or "if_many"
  },
})

-- 保留主题设置的前景色等属性，只清除背景。
local function clear_diagnostic_background()
  local groups = {
    "DiagnosticVirtualTextError",
    "DiagnosticVirtualTextWarn",
    "DiagnosticVirtualTextInfo",
    "DiagnosticVirtualTextHint",
    "DiagnosticVirtualTextOk",
  }

  for _, name in ipairs(groups) do
    local hl = vim.api.nvim_get_hl(0, {
      name = name,
      link = false,
    })

    hl.bg = nil
    hl.ctermbg = nil

    vim.api.nvim_set_hl(0, name, hl)
  end
end

local diagnostic_group = vim.api.nvim_create_augroup(
  "CustomDiagnosticHighlights",
  { clear = true }
)

vim.api.nvim_create_autocmd("ColorScheme", {
  group = diagnostic_group,
  callback = clear_diagnostic_background,
})

clear_diagnostic_background()

-- 复制内容时高亮。
local yank_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })

vim.api.nvim_create_autocmd("TextYankPost", {
  group = yank_group,
  pattern = "*",
  callback = function()
    vim.hl.on_yank()
  end,
})
