return {
  "olimorris/codecompanion.nvim",
  version = "^19.0.0",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  opts = {
    interactions = {
      chat = {
        adapter = "anthropic",
        model = "claude-sonnet-4-20250514"
      },
    },
    opts = {
      log_level = "DEBUG",
    },
  },
  config = function()
  end
}
