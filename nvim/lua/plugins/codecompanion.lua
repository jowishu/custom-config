return {
  "olimorris/codecompanion.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  config = function()
    require("codecompanion").setup({
      adapters = {
        http = {
          openai = function()
            return require("codecompanion.adapters").extend("openai", {
              url = "https://tokenverse.corp.kuaishou.com/v1/chat/completions",
              env = {
                api_key = function()
                  return os.getenv("TOKENVERSE_API_KEY")
                end
              },
              headers = {
                ["Authorization"] = "Bearer ${api_key}",
              },
              schema = {
                model = {
                  default = "GLM-5-1",
                }
              },
              opts = {
                compaction = false,
              },
            })
          end,
        },
      },
      interactions = {
        chat = {
          adapter = "openai",
        },
        inline = {
          adapter = "openai",
        }
      },
      opts = {
        log_level = "DEBUG",
        language = "Chinese",
      },
    })
  end
}
