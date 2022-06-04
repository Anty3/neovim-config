local function map(m, l, r, o)
  local opts = { noremap = true, silent = true }
  if o then
    opts = vim.tbl_extend("force", opts, o)
  end

  vim.keymap.set(m, l, r, opts)
end

-- Moving to the start and end of the line
map('n', 'H', '^')
map('x', 'H', '^')
map('n', 'L', 'g_')
map('x', 'L', 'g_')

-- Comments
map("n", "<M-;>", ":lua require('Comment.api').toggle_current_linewise()<CR>")
map("v", "<M-;>", ":lua require('Comment.api').toggle_linewise_op(vim.fn.visualmode())<CR>")
map("i", "<M-;>", "<cmd>lua require('Comment.api').toggle_current_linewise()<CR>")

-- Replaces word under the cursor and then lets you go to/replace the next/prev instance by using n/N (to move) or . (to move and replace)
map("n", "<Leader>x", "*``cgn")

-- Toggle spell checking
map('n', '<F2>', ':set spell!<CR>')
map('i', '<F2>', ':set spell!<CR>')

-- Moving between splits
map("n", "<C-h>", "<C-W><C-h>")
map("n", "<C-l>", "<C-W><C-L>")
map("n", "<C-j>", "<C-W><C-j>")
map("n", "<C-k>", "<C-W><C-k>")

-- Resizing splits
map("n", "<M-l>", ":vertical resize +5<CR>")
map("n", "<M-h>", ":vertical resize -5<CR>")
map("n", "<M-j>", ":resize +5<CR>")
map("n", "<M-k>", ":resize -5<CR>")

-- Keep visual mode after changing indent
map("v", ">", ">gv")
map("v", "<", "<gv")

-- Moving lines
map("n", "J", ":m+1<CR>")
map("n", "K", ":m-2<CR>")
map("v", "J", ":m'>+<CR>gv")
map("v", "K", ":m-2<CR>gv")

map("n", "d", '"_d')
map("n", "c", '"_c')
map("n", "X", "dd")

-- Hop
map("n", "<leader>hw", ":HopWord<CR>")
map("n", "<leader>hc", ":HopChar1<CR>")
map("n", "<leader>hl", ":HopLine<CR>")
map("n", "<leader>hs", ":HopLineStart<CR>")

-- Telescope
map("n", "<leader>f", ":Telescope find_files hidden=true<CR>")
map("n", "<leader>g", ":Telescope live_grep<CR>")
map("n", "<leader>b", ":Telescope buffers<CR>")

-- NvimTree
map("n", "<leader>m", ":NvimTreeFindFile<CR>")
map("n", "<leader>n", ":NvimTreeToggle<CR>")
map("n", "<C-n>", ":NvimTreeFocus<CR>")

-- NeoTree
-- map("n", "<leader>m", ":Neotree toggle show<CR>")
-- map("n", "<leader>n", ":Neotree toggle<CR>")
-- map("n", "<C-n>", ":Neotree focus<CR>")
-- map("n", "<M-g>", ":Neotree git_status<CR>")

-- Switching Buffers
map("n", "<Tab>", ":bn<CR>")
map("n", "<S-Tab>", ":bp<CR>")
map("n", "<leader>;", "<C-6>")

-- Delete buffer without breaking the layout
map("n", "<M-w>", ":Bdelete<CR>")

-- Floaterm
-- map("n", "<F12>", ":FloatermToggle<CR>")
-- map("t", "<F12>", "<C-\\><C-n>:FloatermToggle<CR>")


