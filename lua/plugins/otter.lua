return {
    "otter.nvim",
    after = function()
        local otter = require("otter")
        otter.setup()

        vim.api.nvim_create_autocmd("LspAttach", {
            callback = function()
                otter.activate()
            end,
            desc = "Activate otter on LSP attach",
            group = vim.api.nvim_create_augroup("otter-lsp-attach", { clear = true }),
        })
    end,
}
