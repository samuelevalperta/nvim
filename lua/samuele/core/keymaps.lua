-- set leader key to space
vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

---------------------
-- General Keymaps
---------------------

-- use jk to exit insert mode
keymap.set("i", "jk", "<ESC>")

-- clear search highlights
keymap.set("n", "<leader>nh", ":nohl<CR>")

-- delete single character without copying into register
keymap.set("n", "x", '"_x')
keymap.set("v", "x", '"_x')

-- yank from cursor to eol
keymap.set("n", "Y", "y$")

-- increment/decrement numbers
-- increment with <Ctrl-a>
-- decrement with <Ctrl-x>

-- window management
keymap.set("n", "<leader>sh", "<C-w>v") -- split window vertically
keymap.set("n", "<leader>sv", "<C-w>s") -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=") -- make split windows equal width & height
keymap.set("n", "<leader>sx", ":close<CR>") -- close current split window

keymap.set("n", "<leader>to", ":tabnew<CR>") -- open new tab
keymap.set("n", "<leader>tx", ":tabclose<CR>") -- close current tab
keymap.set("n", "<leader>tn", ":tabn<CR>") --  go to next tab
keymap.set("n", "<leader>tp", ":tabp<CR>") --  go to previous tab

-- move line
keymap.set("n", "<A-j>", ":m .+1<CR>==")
keymap.set("n", "<A-k>", ":m .-2<CR>==")

-- run python script
keymap.set("n", "<leader><CR>", ":w <CR>:!clear <CR> !python3 %<CR>")


-- plugin keymaps

-- vim-maximizer
keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>")

-- Surround
-- surround with ys[motion][char], ysm" will surround the next word with "
-- remove surround with ds[char]
-- change surround with cs[char_to_change][char_to_change_with]

-- ReplaceWithRegister
-- gr[motion], replace the next object with the object in the register

-- Comment
-- gc[motion] toggle comment on object

-- nvim tree
keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>") -- toggle file explorer

-- telescope
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>") -- find files within current working directory, respects .gitignore
keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>") -- find string in current working directory as you type
keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>") -- find string under cursor in current working directory
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>") -- list open buffers in current neovim instance
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>") -- list available help tags

-- alternate-toggler
keymap.set("n", "<leader>tb", ":ToggleAlternate<CR>")

