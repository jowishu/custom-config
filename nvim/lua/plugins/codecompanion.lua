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
                api_key = function ()
                  return os.getenv("TOKENVERSE_API_KEY")
                end
              },
              headers = {
                ["Authorization"] = "Bearer ${api_key}",
              },
              schema = {
                model = {
                  default = "glm-5-2",
                  choices = {
                    "deepseek-v4-pro",
                    "glm-5-2",
                    "GLM-5-1",
                    "kimi-k2-6",
                  },
                },
                top_p = {
                  enabled = function()
                    return false
                  end,
                },
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
                  default = "claude-opus-4-8",
                  choices = {
                    "claude-opus-4-8",
                    "claude-opus-4-7",
                    "gpt-5-5",
                  }
                },
                top_p = {
                  enabled = function()
                    return false
                  end,
                },
              },
              opts = {
                compaction = false,
              },
            })
          end,
          -- kimi
          kimi = function()
              return require("codecompanion.adapters").extend("openai", {
                name = "kimi",
                url = "https://api.moonshot.cn/v1/chat/completions",
                env = {
                  api_key = function()
                    return os.getenv("KIMI_API_KEY")
                  end
                },
                headers = {
                  ["Authorization"] = "Bearer ${api_key}",
                },
                schema = {
                  model = {
                    default = "kimi-k2.6",
                    choices = {
                      "kimi-k2.6",
                    }
                  },
                  top_p = {
                    default = 0.95,
                  },
                },
                opts = {
                  compaction = false,
                },
              })
          end,
        },
      },
      interactions = {
        background = {
          adapter = "tokenverse_plan",
        },
        chat = {
          adapter = "tokenverse_plan",
          roles = {
            llm = function(adapter)
              return "Assistant (" .. adapter.name ..")"
            end,
            user = "Jiabw"
          },
        },
        inline = {
          adapter = "tokenverse_plan",
        },
        cmd = {
          adapter = "tokenverse_plan",
        },
      },
      display = {
        chat = {
          -- show_settings = true,
          start_in_insert_mode = true,
        },
      },
      opts = {
        log_level = "DEBUG",
        language = "Chinese",
      },
    })
  end
}
