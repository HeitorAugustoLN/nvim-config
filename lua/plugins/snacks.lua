return {
    "snacks.nvim",
    after = function()
        require("snacks").setup({ picker = {} })

        vim.keymap.set("n", "<leader>/", function()
            Snacks.picker.lines()
        end, { desc = "Fuzzily search in current buffer" })

        vim.keymap.set("n", "<leader>s/", function()
            Snacks.picker.grep_buffers()
        end, { desc = "Search in open files" })

        vim.keymap.set("n", '<leader>s"', function()
            Snacks.picker.registers()
        end, { desc = "Search registers" })

        vim.keymap.set("n", "<leader>sb", function()
            Snacks.picker.buffers()
        end, { desc = "Search buffers" })

        vim.keymap.set("n", "<leader>sd", function()
            Snacks.picker.diagnostics()
        end, { desc = "Search diagnostics" })

        vim.keymap.set("n", "<leader>sg", function()
            Snacks.picker.grep()
        end, { desc = "Search by grep" })

        vim.keymap.set("n", "<leader>sh", function()
            Snacks.picker.help()
        end, { desc = "Search help" })

        vim.keymap.set("n", "<leader>sk", function()
            Snacks.picker.keymaps()
        end, { desc = "Search keymaps" })

        vim.keymap.set("n", "<leader>sf", function()
            Snacks.picker.files()
        end, { desc = "Search files" })

        vim.keymap.set("n", "<leader>sp", function()
            Snacks.picker.pickers()
        end, { desc = "Search pickers" })

        vim.keymap.set("n", "<leader>sr", function()
            Snacks.picker.recent()
        end, { desc = "Search recent files" })

        vim.keymap.set("n", "<leader>sR", function()
            Snacks.picker.resume()
        end, { desc = "Resume search" })

        vim.keymap.set({ "n", "x" }, "<leader>sw", function()
            Snacks.picker.grep_word()
        end, { desc = "Search word" })
    end,
    before = function()
        require("lz.n").trigger_load("mini.icons")
    end,
    lazy = false,
}
