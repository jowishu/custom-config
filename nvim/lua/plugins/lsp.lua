return {
  -- Main LSP Configuration
  "neovim/nvim-lspconfig",
  event = {"BufReadPre", "BufNewFile"},
  dependencies = {
    -- Automatically install LSPs and related tools to stdpath for Neovim
    -- NOTE: Must be loaded before dependants
    {"williamboman/mason.nvim", config = true},

    -- Useful status updates for LSP.
    "williamboman/mason-lspconfig.nvim",

    -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
    {"j-hui/fidget.nvim", opts = {}},

    -- Allows extra capabilities provided by nvim-cmp
    "hrsh7th/cmp-nvim-lsp",

    -- navbuddy
    {
      "SmiteshP/nvim-navbuddy",
      dependencies = {
        "SmiteshP/nvim-navic",
        "MunifTanjim/nui.nvim"
      },
      opts = {
        lsp = { auto_attach = true }
      }
    },
  },

  config = function()
    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("kickstart-lsp-attach", {clear = true}),
      callback = function(event)
        local opts = {buffer = event.buf, silent = true}
        opts.desc = "Go to definition"
        vim.keymap.set("n", "<C-j>", require("telescope.builtin").lsp_definitions, opts)
      end
    })

    vim.api.nvim_create_user_command("DiagsToggle", function()
      local current_value = vim.diagnostic.config().virtual_text
      if current_value then
        vim.diagnostic.config({virtual_text = false})
      else
        vim.diagnostic.config({virtual_text = true})
      end
    end, {})

    -- LSP servers and clients are able to communicate to each other what features they support.
    --  By default, Neovim doesn't support everything that is in the LSP specification.
    --  When you add nvim-cmp, luasnip, etc. Neovim now has *more* capabilities.
    --  So, we create new capabilities with nvim cmp, and then broadcast that to the servers.
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = vim.tbl_deep_extend("force", capabilities, require(
                                         "cmp_nvim_lsp").default_capabilities())

    require("mason").setup()

    require("mason-lspconfig").setup({
      ensure_installed = {"clangd", "pyright", "jsonls"}
    })
    vim.lsp.config("clangd", {
      filetypes = {"c", "cpp", "cuda"},
      root_markser = {
        "compile_commands.json", ".git", ".clangd", ".clang-tidy",
        ".clang-format"
      },
      capabilities = {offsetEncoding = {"utf-8"}},
      cmd = {"clangd", "--clang-tidy"},
    })
  end
}
