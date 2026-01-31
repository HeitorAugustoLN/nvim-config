vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear search highlights" })
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic quickfix list" })

vim.keymap.set({ "n", "v" }, "<leader>y", '"+y', { desc = "Yank to clipboard" })
vim.keymap.set({ "n", "v" }, "<leader>Y", '"+y$', { desc = "Yank to end of line to clipboard" })
vim.keymap.set({ "n", "v" }, "<leader>p", '"+p', { desc = "Paste from clipboard after cursor" })
vim.keymap.set({ "n", "v" }, "<leader>P", '"+P', { desc = "Paste from clipboard before cursor" })

vim.keymap.set({ "n", "v" }, "<A-d>", '"_d', { desc = "Delete without yanking" })
vim.keymap.set({ "n", "v" }, "<A-c>", '"_c', { desc = "Change without yanking" })
vim.keymap.set({ "n", "v" }, "<A-D>", '"_D', { desc = "Delete to end of line without yanking" })
vim.keymap.set({ "n", "v" }, "<A-C>", '"_C', { desc = "Change to end of line without yanking" })
