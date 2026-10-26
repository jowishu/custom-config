return { -- Highlight, edit, and navigate code
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  branch = "main",
  lazy = false,
  config = function()
    local ts = require("nvim-treesitter")
    ts.setup()

    ts.install({
      "c",
      "cpp",
      "python",
      "cuda",
      "cmake",
      "comment",
      "llvm",
      "yaml",
      "toml",
      "json",
      "tablegen",
      "markdown",
      "proto",
      "ssh_config",
      "git_config",
      "xml",
    })

    local group = vim.api.nvim_create_augroup(
      "CustomTreesitter",
      { clear = true }
    )
    vim.api.nvim_create_autocmd("FileType", {
      group = group,
      pattern = {
        "c",
        "cpp",
        "python",
        "cuda",
        "cmake",
        "llvm",
        "yaml",
        "toml",
        "json",
        "tablegen",
        "markdown",
        "proto",
        "pbtxt",
        "sshconfig",
        "gitconfig",
        "xml",
      },
      callback = function(event)
        -- 解析器尚未安装完成或不支持该文件时，保留原有行为。
        local ok = pcall(vim.treesitter.start, event.buf)
        if not ok then
          return
        end

        -- 为当前触发 FileType 的 buffer 设置缩进。
        vim.bo[event.buf].indentexpr =
          "v:lua.require'nvim-treesitter'.indentexpr()"
      end,
    })
  end
}
