local keymap = vim.keymap.set
local opts = { silent = true }

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "

-- Modes
local modes = { normal= "n", insert="i", visual="v", vblock="x", term="t", command="c" }


for _, val in pairs(modes) do
  if val == 't' or val == 'c' then
    goto continue
  end
  keymap(val, '<Up>', '<Nop>', opts)
  keymap(val, '<Down>', '<Nop>', opts)
  keymap(val, '<Left>', '<Nop>', opts)
  keymap(val, '<Right>', '<Nop>', opts)
  ::continue::
end

-- * NORMAL MODE * --
-- Clear highlights
keymap("n", "<leader>h", "<cmd>nohlsearch<CR>", opts)
-- Delete without putting the deleted stuff in the buffer 
keymap("n", "<leader>d", "\"_dd", opts)
keymap("v", "<leader>d", "\"_dd", opts)
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)
-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize +2<CR>", opts)
-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- * VISUAL MODE * --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)
-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

-- * VISUAL BLOCK * --
-- Move text up and down
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- * OTHER PLUGINS * -- 
-- NvimTree
keymap("n", "<leader>e", ":NvimTreeToggle<CR>", opts)
-- Telescope
keymap("n", "<leader>ff", ":Telescope find_files<CR>", opts)
keymap("n", "<leader>lg", ":Telescope live_grep<CR>", opts)
keymap("n", "<leader>bf", ":Telescope buffers<CR>", opts)
-- FTerm
keymap("n", "<C-\\>", "<CMD>lua require('FTerm').toggle()<CR>")
keymap("t", "<C-\\>", "<C-\\><C-n><CMD>lua require('FTerm').toggle()<CR>")
