-- Shorten function name
local keymap = vim.keymap.set
-- Silent keymap option
local opts = { silent = true }

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Split window
keymap("n", "<leader>sv", "<C-w>v", opts)
keymap("n", "<leader>sh", "<C-w>s", opts)
keymap("n", "<leader>se", "<C-w>=", opts)
keymap("n", "<leader>sx", ":close<CR>", opts)

-- New tab
keymap("n", "<leader>to", ":tabnew<CR>", opts)
keymap("n", "<leader>tx", ":tabclose<CR>", opts)
keymap("n", "<leader>tn", ":tabn<CR>", opts)
keymap("n", "<leader>tp", ":tabp<CR>", opts)

-- Move window
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-l>", ":bnext<CR>", opts)

-- Close buffers
keymap("n", "<S-q>", "<cmd>Bdelete!<CR>", opts)

-- Better paste
-- Replace currently selected text with default register without yanking it
keymap("v", "p", '"_dP', opts)

-- Insert --
-- Press jk fast to enter
-- keymap("i", "jk", "<ESC>", opts)

-- Clear highlights
keymap("n", "<leader>nh", ":nohl<CR>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Increment/Decrement
keymap("n", "+", "<C-a>", opts)
keymap("n", "-", "<C-x>", opts)

-- Select all
keymap("n", "<C-a>", "gg<S-v>G", opts)

-- Save file
keymap("n", "<leader>s", ":w<CR>", opts)

-- NvimTree
keymap("n", "<leader>e", ":NvimTreeToggle<CR>", opts)

-- Telescope
keymap("n", "<leader>ff", ":Telescope find_files<CR>", opts)
keymap("n", "<leader>fs", ":Telescope live_grep<CR>", opts)
keymap("n", "<leader>fc", ":Telescope grep_string<CR>", opts)
keymap("n", "<leader>fb", ":Telescope buffers<CR>", opts)
keymap("n", "<leader>fh", ":Telescope help_tags<CR>", opts)










-- -- Git
-- keymap("n", "<leader>gg", "<cmd>lua _LAZYGIT_TOGGLE()<CR>", opts)
--
-- -- Comment
-- keymap("n", "<leader>/", "<cmd>lua require('Comment.api').toggle_current_linewise()<CR>", opts)
-- keymap("x", "<leader>/", '<ESC><CMD>lua require("Comment.api").toggle_linewise_op(vim.fn.visualmode())<CR>')
--
-- -- DAP
-- keymap("n", "<leader>db", "<cmd>lua require'dap'.toggle_breakpoint()<cr>", opts)
-- keymap("n", "<leader>dc", "<cmd>lua require'dap'.continue()<cr>", opts)
-- keymap("n", "<leader>di", "<cmd>lua require'dap'.step_into()<cr>", opts)
-- keymap("n", "<leader>do", "<cmd>lua require'dap'.step_over()<cr>", opts)
-- keymap("n", "<leader>dO", "<cmd>lua require'dap'.step_out()<cr>", opts)
-- keymap("n", "<leader>dr", "<cmd>lua require'dap'.repl.toggle()<cr>", opts)
-- keymap("n", "<leader>dl", "<cmd>lua require'dap'.run_last()<cr>", opts)
-- keymap("n", "<leader>du", "<cmd>lua require'dapui'.toggle()<cr>", opts)
-- keymap("n", "<leader>dt", "<cmd>lua require'dap'.terminate()<cr>", opts)






-- ################################
-- ########  VIM SURROUND:  #######
-- ################################
-- ysiw"   = 'ys' is the keybinding to add a surrounding, 'iw' is the text object for a word and '"' is the pattern we want to add
-- ds"     = Remove suroundings. 'ds' is the keybinding to delete and '"' is the surrounding pattern we want to delete
-- cs'"    = Replace " with '. 'cs' is the keybinding to change a surrounding, ''' is the thing we want to change and '"' is the new surrounding


-- ###########################################
-- ########  VIM ReplaceWithRegister:  #######
-- ###########################################
-- coppy text and repace text with what I've coppied
-- 1. copy text with 'yw'
-- 2. move to text we want to repace
-- 3. type 'grw' to repace the text


-- ##########################
-- ########  COMMENT  #######
-- ##########################
-- gcc      = comment out whole line
-- gc9j     = comment out lines from current to 9 below
-- gcap     = comment out a paragraph
-- gciw     = comment out a word


-- #############################
-- ########  NVIM-TREE:  #######
-- #############################
-- a     = Add directory or file
-- r     = Rename
-- d     = Delete


-- ##############################
-- ########  COMPLETION:  #######
-- ##############################
-- Ctrl + p      = Move to the previous item
-- Ctrl + n      = Move to the next item
-- Ctrl + b      = Scrolling option in case of getting more text in snippets/buffers window
-- Ctrl + f      = Scrolling option in case of getting more text in snippets/buffers window
-- Ctrl + Space  = Giving us the list of all the available item completion
-- Ctrl + e      = Exit 
-- CR            = <Carriage return> a.k.a Enter key -> will confirm selection
-- Tab           = Moving inside the parts of snippets
-- 
-- ###############################
-- ########  SEARCH MODE:  #######
-- ###############################
-- Ctrl + G      = Move to the next match
-- Ctrl + T      = Move to the previous match
-- 
-- 
-- #############################
-- ########  TELESCOPE:  #######
-- #############################
-- <Space> + f           = search for files 
-- <Space> + F           = search for text in files
-- <Space> + fr          = search for references in files
-- <Space> + fb          = seaerch for git branches
-- 
-- 
-- #############################
-- ########  TELESCOPE:  #######
-- #############################
-- - every get symbol is called hunk
-- :gitsigns next_hunk       = move to the next hunk
-- :gitsigns prev_hunk
-- :gitsigns preview_hunk    = see what has been changed
-- :gitsigns blame_hunk      = check who made a change


