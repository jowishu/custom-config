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
              url = "https://tokenverse.corp.kuaishou.com/v1",
              env = {
                -- api_key = "sk-2PoySFmky9pHUotjb",
                api_key = function()
                  return os.getenv("TOKENVERSE_API_KEY")
                end
              },
              headers = {
                -- ["Authorization"] = "Bearer ${api_key}",
                ["x-api-key"] = "${api_key}",
              },
            })
          end,
        },
      },
      interactions = {
        chat = {
          adapter = "anthropic",
          model = "tokenverse/GLM-5"
        },
        background = {
          adapter = {
            name = "anthropic",
            model = "tokenverse/GLM-5",
          }
        },
        inline = {
          adapter = "anthropic",
        },
        cmd = {
          adapter = "anthropic",
        },
      },
      opts = {
        log_level = "DEBUG",
        language = "Chinese",
      }
    })
  end
}
