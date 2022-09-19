local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

vim.g.mapleader = " "

-- map("n", "<leader>on", ":set number relativenumber<CR>", opts)
map("v", "<", "<gv", opts)
map("v", ">", ">gv", opts)
map("n", "<leader>e", ":NvimTreeToggle<CR>", opts)

map("n", "gd", ":lua vim.lsp.buf.definition()<cr>", opts)
map("n", "K", ":lua vim.lsp.buf.hover()<cr>", opts)
map("n", "gi", ":lua vim.lsp.buf.implementation()<cr>", opts)
map("n", "<leader>rn", ":lua vim.lsp.buf.rename()<cr>", opts)
map("n", "<leader>af", ":lua vim.lsp.buf.code_action()<cr>", opts)
map("n", "gr", ":lua vim.lsp.buf.references()<cr>", opts)
map("n", "[d", ":lua vim.diagnostic.goto_prev()<cr>", opts)
map("n", "]d", ":lua vim.diagnostic.goto_next()<cr>", opts)
map("n", "<leader>tq", ":lua vim.diagnostic.setloclist()<cr>", opts)

--> NULL
map("n", "<leader>lf", ":lua vim.lsp.buf.format({ timeout_ms = 2000 })<cr>", opts)

--> Gitsigns
map('v', ']c', '<cmd>Gitsigns next_hunk<CR>', opts)
map('v', '[c', '<cmd>Gitsigns prev_hunk<CR>', opts)
map('n', '<leader>hs', '<cmd>Gitsigns stage_hunk<CR>', opts)
map('v', '<leader>hs', '<cmd>Gitsigns stage_hunk<CR>', opts)
map('n', '<leader>hr', '<cmd>Gitsigns reset_hunk<CR>', opts)
map('v', '<leader>hr', '<cmd>Gitsigns reset_hunk<CR>', opts)
map('n', '<leader>hS', '<cmd>Gitsigns stage_buffer<CR>', opts)
map('n', '<leader>hu', '<cmd>Gitsigns undo_stage_hunk<CR>', opts)
map('n', '<leader>hR', '<cmd>Gitsigns reset_buffer<CR>', opts)
map('n', '<leader>hp', '<cmd>Gitsigns preview_hunk<CR>', opts)
map('n', '<leader>hb', '<cmd>Gitsigns blame_line<CR>', opts)
map('n', '<leader>tb', '<cmd>Gitsigns toggle_current_line_blame<CR>', opts)
map('n', '<leader>hd', '<cmd>Gitsigns diffthis<CR>', opts)
map('n', '<leader>hD', '<cmd>Gitsigns diffthis "~"<CR>', opts)
map('n', '<leader>td', '<cmd>Gitsigns toggle_deleted<CR>', opts)

--> Git-fugitive
map('n', '<leader>ga', '<cmd>0G<CR>', opts)
map('n', '<leader>gw', '<cmd>Gwrite<CR>', opts)
map('n', '<leader>gp', '<cmd>Git push<CR>', opts)


--> TELESCOPE MAPPINGS
map('n', '<leader>f', ':Telescope find_files<cr>', opts)
map('n', '<leader>F', ':Telescope live_grep<cr>', opts)
map('n', '<leader>fr', ':Telescope lsp_references<cr>', opts)
map('n', '<leader>fb', ':Telescope git_branches<cr>', opts)
