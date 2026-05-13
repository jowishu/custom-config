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
          -- tokenverse
          tokenverse = function()
            return require("codecompanion.adapters").extend("openai", {
              name = "tokenverse",
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
                  choices = {
                    "GLM-5-1",
                    "kimi-k2-5"
                  }
                }
              },
              opts = {
                compaction = false,
              },
            })
          end,
          -- tokenverse_plan
          tokenverse_plan = function()
              return require("codecompanion.adapters").extend("openai", {
                name = "tokenverse_plan",
                url = "https://tokenverse.corp.kuaishou.com/v1/chat/completions",
                env = {
                  api_key = function()
                    return os.getenv("TOKENVERSE_PLAN_API_KEY")
                  end
                },
                headers = {
                  ["Authorization"] = "Bearer ${api_key}",
                },
                schema = {
                  model = {
                    default = "claude-opus-4-7",
                    choices = {
                      "claude-opus-4-7",
                      "gpt-5-5",
                    }
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
          adapter = "tokenverse",
          roles = {
            user = "Jiabw"
          },
        },
        inline = {
          adapter = "tokenverse",
        },
        cmd = {
          adapter = "tokenverse",
        },
      },
      prompt_library = {
        markdown = {
          dirs = {
            "~/.config/nvim/prompts"
          }
        },
      },
      opts = {
        -- log_level = "DEBUG",
        language = "Chinese",
      },
    })
  end
}
