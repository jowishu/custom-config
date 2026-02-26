-- clear jump list on start
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    vim.cmd("clearjumps")
  end
})

vim.api.nvim_create_autocmd({"BufNewFile", "BufRead"}, {
  pattern = "*.cu.cc",
  callback = function()
    vim.bo.filetype = "cuda"
  end
})
vim.api.nvim_create_autocmd({"BufNewFile", "BufRead"}, {
  pattern = "*.inc",
  callback = function()
    vim.bo.filetype = "cpp"
  end
})

vim.api.nvim_create_autocmd({"BufNewFile", "BufRead"}, {
  pattern = "*.mir",
  callback = function()
    vim.bo.filetype = "yaml"
  end
})

vim.api.nvim_create_autocmd({"BufNewFile", "BufRead"}, {
  pattern = "*.ll",
  callback = function()
    vim.bo.filetype = "llvm"
  end
})

vim.api.nvim_create_autocmd({"BufNewFile", "BufRead"}, {
  pattern = "*.td",
  callback = function()
    vim.bo.filetype = "tablegen"
  end
})

vim.api.nvim_create_autocmd({"BufNewFile", "BufRead"}, {
  pattern = "*.fbs",
  callback = function()
    vim.bo.filetype = "fbs"
  end
})

vim.api.nvim_create_autocmd({"BufNewFile", "BufRead"}, {
  pattern = "lit.*cfg",
  callback = function()
    vim.bo.filetype = "python"
  end
})

vim.api.nvim_create_autocmd({"BufNewFile", "BufRead"}, {
  pattern = "*.onnxtxt",
  callback = function()
    vim.bo.filetype = "pbtxt"
  end
})
