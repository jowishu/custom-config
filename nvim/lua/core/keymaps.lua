-- Set leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Disable the spacebar key's default behavior in Normal and Visual modes
vim.keymap.set({"n", "v"}, "<Space>", "<Nop>", {silent = true})

-- For conciseness
local opts = {noremap = true, silent = true}

-- save file without auto-formatting
vim.keymap.set("n", "<leader>sn", "<cmd>noautocmd w <CR>", opts)

-- Vertical scroll and center
vim.keymap.set("n", "<C-d>", "<C-d>zz", opts)
vim.keymap.set("n", "<C-u>", "<C-u>zz", opts)

-- Find and center
vim.keymap.set("n", "n", "nzzzv", opts)
vim.keymap.set("n", "N", "Nzzzv", opts)

-- Buffers
vim.keymap.set("n", "<C-n>", ":bnext<CR>", opts)
-- vim.keymap.set('n', '<C-p]>', ':bprevious<CR>', opts)
vim.keymap.set("n", "<leader>x", ":bdelete!<CR>", opts) -- close buffer
vim.keymap.set("n", "<leader>b", "<cmd> enew <CR>", opts) -- new buffer

-- Window management
vim.keymap.set("n", "<leader>v", "<C-w>v", opts) -- split window vertically
vim.keymap.set("n", "<leader>h", "<C-w>s", opts) -- split window horizontally
-- vim.keymap.set('n', '<leader>se', '<C-w>=', opts)     -- make split windows equal width & height

-- Tabs
vim.keymap.set("n", "<CR>", ":tabnew %<CR>", opts) -- open new tab
vim.keymap.set("n", "<C-c>", ":tabclose<CR>", opts) -- close current tab

-- Toggle line wrapping
vim.keymap.set("n", "<leader>lw", "<cmd>set wrap!<CR>", opts)

-- Stay in indent mode
vim.keymap.set("v", "<", "<gv", opts)
vim.keymap.set("v", ">", ">gv", opts)

-- Keep last yanked when pasting
vim.keymap.set("v", "p", '"_dP', opts)

vim.api.nvim_create_user_command("WQ", "wq", {})
vim.api.nvim_create_user_command("Wq", "wq", {})
vim.api.nvim_create_user_command("W", "w", {})
vim.api.nvim_create_user_command("Q", "q", {})

-- nerd tree
vim.keymap.set("n", "<C-e>", ":Neotree toggle<CR>", opts)

-- taglist
vim.keymap.set("n", "<C-l>", ":TagbarToggle<CR>", opts)
vim.keymap.set("n", "<C-l>", ":Navbuddy<CR>", opts)

-- switch between header and source
vim.keymap.set("n", "<C-s>", ":LspClangdSwitchSourceHeader<CR>", opts)

-- remap Ctrl-] to Ctrl-i:
vim.keymap.set("n", "<C-i>", "<C-]>", opts)

vim.keymap.set("n", "<leader>d", ":DiagsToggle<CR>", opts)

-- fix available
local function quickfix()
  vim.lsp.buf.code_action({
    filter = function(a) return a.isPreferred end,
    apply = true
  })
end
vim.keymap.set("n", "<C-x>", quickfix, opts)
