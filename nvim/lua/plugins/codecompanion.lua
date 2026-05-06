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
          anthropic = function()
            return require("codecompanion.adapters").extend("anthropic", {
              url = "https://tokenverse.corp.kuaishou.com/v1/chat/completions",
              env = {
                api_key = function()
                  return os.getenv("TOKENVERSE_API_KEY")
                end
              },
              headers = {
                ["Authorization"] = "Bearer ${api_key}",
                ["Content-Type"] = "application/json",
                ["x-api-key"] = "${api_key}",
              },
            })
          end,
        },
      },
      opts = {
        language = "Chinese",
        interactions = {
          chat = {
            adapter = "anthropic",
            model = "GLM-5.1"
          },
          background = {
            adapter = {
              name = "anthropic",
              model = "GLM-5.1"
            }
          },
          inline = {
            adapter = "anthropic",
          },
          cmd = {
            adapter = "anthropic",
          },
        },
      }
    })
  end
}
