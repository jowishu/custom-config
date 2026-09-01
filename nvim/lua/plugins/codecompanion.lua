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
                  default = "glm-5-3",
                  choices = {
                    "glm-5-3",
                    "kimi-k3",
                  },
                },
                top_p = {
                  enabled = function()
                    return false
                  end,
                },
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
                  default = "claude-opus-5",
                  choices = {
                    "claude-opus-5",
                    "claude-sonnet-5",
                    "claude-opus-4-8",
                    "gpt-5-6-sol",
                    "gpt-5-5",
                  }
                },
                top_p = {
                  enabled = function()
                    return false
                  end,
                },
              },
            })
          end,
          -- tokenverse_prod
          tokenverse_prod = function()
            return require("codecompanion.adapters").extend("openai", {
              name = "tokenverse_prod",
              url = "https://tokenverse.corp.kuaishou.com/v1/chat/completions",
              env = {
                api_key = function()
                  return os.getenv("TOKENVERSE_PROD_API_KEY")
                end
              },
              headers = {
                ["Authorization"] = "Bearer ${api_key}",
              },
              schema = {
                model = {
                  default = "claude-opus-5",
                  choices = {
                    "claude-opus-5",
                    "claude-sonnet-5",
                    "claude-opus-4-8",
                    "gpt-5-6-sol",
                    "gpt-5-5",
                  }
                },
                top_p = {
                  enabled = function()
                    return false
                  end,
                },
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
              })
          end,
        },
      },
      interactions = {
        chat = {
          adapter = "tokenverse",
          roles = {
            llm = function(adapter)
              return "Assistant (" .. adapter.name ..")"
            end,
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
      display = {
        chat = {
          -- show_settings = true,
          start_in_insert_mode = false,
        },
      },
      opts = {
        -- log_level = "DEBUG",
        language = "Chinese",
      },
    })
  end
}
