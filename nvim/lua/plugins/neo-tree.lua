return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {"MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim"},
  lazy = false,
  opts = {
    enable_git_status = false,
    enable_diagnostics = false,
    window = {
      position = "left",
      width = 32,
      mapping_options = {noremap = true, nowait = true},
      mapping = {}
    },
    default_component_configs = {
      file_size = {enabled = false},
      type = {enabled = false},
      last_modified = {enabled = false},
      created = {enabled = false}
    },
    filesystem = {
      filtered_items = {
        hide_dotfiles = true,
        hide_gitignored = false,
        hide_ignored = false
      },
      window = {
        mappings = {
          ["/"] = "noop",
          ["o"] = "open",
          ["<cr>"] = "open",
          ["<esc>"] = "cancel",
          ["S"] = "open_split",
          ["s"] = "open_vsplit",
          ["a"] = {"add", config = {show_path = "none"}},
          ["d"] = "delete",
          ["r"] = "rename",
          ["m"] = "move",
          ["R"] = "refresh",
          ["i"] = "show_file_details"
        }
      }
    }
  }
}
