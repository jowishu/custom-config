-- Standalone plugins with less than 10 lines of config go here
return {
  -- {
  --   -- Detect tabstop and shiftwidth automatically
  --   'tpope/vim-sleuth',
  -- },
  {
    -- Powerful Git integration for Vim
    "tpope/vim-fugitive"
  }, {
    -- Autoclose parentheses, brackets, quotes, etc.
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = true,
    opts = {}
  }, {
    -- Highlight todo, notes, etc in comments
    "folke/todo-comments.nvim",
    event = "VimEnter",
    dependencies = {"nvim-lua/plenary.nvim"},
    opts = {signs = false}
  }, {"preservim/tagbar"}, {
    -- intelligently reopens files at your last edit position.
    "farmergreg/vim-lastplace"
  }, {
    -- vim-go
    "fatih/vim-go"
  }
}
