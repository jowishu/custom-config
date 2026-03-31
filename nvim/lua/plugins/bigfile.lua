return {
  -- bigfile
  "LunarVim/bigfile.nvim",
  config = function()
    local bigfile = require("bigfile")
    bigfile.setup({
      filesize = 2,
      pattern = { "*" },
      features = {
        "lsp",
        "treesitter",
        "syntax",
      }
    })
  end
}

