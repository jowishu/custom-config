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
          -- kimi
          kimi = function()
              return require("codecompanion.adapters").extend("openai", {
                name = "kimi",
                url = "https://api.moonshot.cn/v1/responses",
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
          adapter = "kimi",
          roles = {
            llm = function(adapter)
              return "Assistant (" .. adapter.name ..")"
            end,
            user = "Jiabw"
          },
          opts = {
            ---@param ctx CodeCompanion.SystemPrompt.Context
            ---@return string
            system_prompt = function(ctx)
              return ctx.default_system_prompt
                .. string.format(
                  [[Additional context:
Do not use markdown tables. Do not use bold text in markdown.
Each line should not exceed 100 characters.
All non-code text responses must be written in the %s language.

The user's current working directory is %s.
The current date is %s.
The user's Neovim version is %s.
The user is working on a %s machine. Please respond with system specific commands if applicable.
]],
                ctx.language,
                ctx.cwd,
                ctx.date,
                ctx.nvim_version,
                ctx.os
              )
            end
          }
        },
        inline = {
          adapter = "kimi",
        },
        cmd = {
          adapter = "kimi",
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
