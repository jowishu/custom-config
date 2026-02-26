return {
  "hrsh7th/nvim-cmp",
  event = {"BufEnter", "BufReadPre", "BufNewFile"},
  dependencies = {
    "hrsh7th/cmp-buffer", "hrsh7th/cmp-nvim-lsp", "hrsh7th/cmp-nvim-lua",
    "hrsh7th/cmp-cmdline", "hrsh7th/cmp-path",
    "hrsh7th/cmp-nvim-lsp-signature-help", "f3fora/cmp-spell",
    "saadparwaiz1/cmp_luasnip", "lukas-reineke/cmp-under-comparator"
  },
  config = function()
    local cmp = require("cmp")
    local cmplsp = require("cmp_nvim_lsp")
    local compare = require("cmp.config.compare")
    local luasnip = require("luasnip")
    local types = require("cmp.types")

    cmplsp.setup()

    local modified_priority = {
      [types.lsp.CompletionItemKind.Variable] = types.lsp.CompletionItemKind
        .Method,
      [types.lsp.CompletionItemKind.Snippet] = 0, -- top
      [types.lsp.CompletionItemKind.Keyword] = 0, -- top
      [types.lsp.CompletionItemKind.Text] = 100 -- bottom
    }

    cmp.setup({
      preselect = false,
      completion = {completeopt = "menu,menuone,preview,noselect"},
      snippet = {expand = function(args) luasnip.lsp_expand(args.body) end},
      matching = {
        disallow_fuzzy_matching = true,
        disallow_fullfuzzy_matching = true,
        disallow_partial_fuzzy_matching = true,
        disallow_partial_matching = false,
        disallow_prefix_unmatching = true
      },
      min_length = 0, -- allow for `from package import _` in Python
      mapping = cmp.mapping.preset.insert({
        ["<CR>"] = cmp.mapping.confirm({select = false}), -- no not select first item
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          else
            fallback()
          end
        end, {"i", "s"}),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, {"i", "s"})
      }),
      sources = cmp.config.sources({
        {name = "nvim_lsp", max_item_count = 20},
        {name = "luasnip", max_item_count = 20},
        {name = "nvim_lua", max_item_count = 20},
        {name = "nvim_lsp_signature_help", max_item_count = 20},
        {name = "buffer", max_item_count = 10}
      }),
      performance = {max_view_entries = 20},
      window = {
        documentation = cmp.config.window.bordered(),
        completion = cmp.config.window.bordered()
      }
    })

    -- `:` cmdline setup.
    cmp.setup.cmdline(":", {
      mapping = cmp.mapping.preset.cmdline(),
      sources = cmp.config.sources({{name = "path"}}, {{name = "cmdline"}}),
      matching = {disallow_symbol_nonprefix_matching = false}
    })
  end
}
