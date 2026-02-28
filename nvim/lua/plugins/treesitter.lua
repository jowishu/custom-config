return { -- Highlight, edit, and navigate code
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  main = "nvim-treesitter.configs", -- Sets main module to use for opts
  branch = "master",
  -- [[ Configure Treesitter ]] See `:help nvim-treesitter`
  opts = {
    ensure_installed = {
      "cpp",
      "python",
      "cuda",
      "cmake",
      "comment",
      "llvm",
      -- "mlir",
      "yaml",
      "toml",
      "json",
      "tablegen",
      "markdown",
      "proto",
      "ssh_config",
      "git_config",
      "tmux",
      "xml",
    },
    -- Autoinstall languages that are not installed
    auto_install = true,
    highlight = {
      enable = true
    },
    indent = {
      enable = true,
      disable = {"ruby"}
    }
  }
}
