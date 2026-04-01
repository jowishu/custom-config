return { -- Highlight, edit, and navigate code
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  branch = "main",
  opts = {
    ensure_installed = {
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
    }
  }
}
