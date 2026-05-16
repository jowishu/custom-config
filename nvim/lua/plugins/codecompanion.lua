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
                  default = "GLM-5-1",
                  choices = {
                    "GLM-5-1",
                    "kimi-k2-6"
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
                    default = "claude-opus-4-8",
                    choices = {
                      "claude-opus-4-8",
                      "claude-opus-4-7",
                      "gpt-5-5",
                    }
                  },
                  top_p = {
                    -- gpt-5-5 模型不支持 top_p 参数，选中该模型时不发送
                    ---@param self CodeCompanion.HTTPAdapter
                    ---@return boolean
                    enabled = function(self)
                      local model = self.schema.model.default
                      if type(model) == "function" then
                        model = model(self)
                      end
                      return model ~= "gpt-5-5"
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
          adapter = "kimi",
        },
        chat = {
          adapter = "kimi",
          roles = {
            llm = function(adapter)
              return "Assistant (" .. adapter.name ..")"
            end,
            user = "Jiabw"
          },
        },
        inline = {
          adapter = "kimi",
        },
        cmd = {
          adapter = "kimi",
        },
      },
      -- -- 自定义 prompt
      -- prompt_library = {
      --   markdown = {
      --     dirs = {
      --       "~/.config/nvim/prompts"
      --     }
      --   },
      -- },
      display = {
        action_palette = {
          opts = {
            show_preset_actions = false,
            show_preset_prompts = false,
            show_preset_rules = false,
          },
        },
        chat = {
          -- show_settings = true,
          start_in_insert_mode = true,
        },
      },
      opts = {
        -- log_level = "DEBUG",
        language = "Chinese",
      },
    })
  end
}
