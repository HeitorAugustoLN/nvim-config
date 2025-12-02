{
  flake.modules.nixvim.autoCommands.lsp.onAttach = # lua
    ''
      if client and client:supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight, bufnr) then
        local highlight_augroup = vim.api.nvim_create_augroup("heitor/lsp_highlight", { clear = false })

        vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
          buffer = bufnr,
          callback = vim.lsp.buf.document_highlight,
          group = highlight_augroup,
        })

        vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
          buffer = bufnr,
          callback = vim.lsp.buf.clear_references,
          group = highlight_augroup,
        })

        vim.api.nvim_create_autocmd("LspDetach", {
          group = vim.api.nvim_create_augroup("heitor/lsp_detach", { clear = true }),
          callback = function(detach_event)
            vim.lsp.buf.clear_references()
            vim.api.nvim_clear_autocmds({ group = "heitor/lsp_highlight", buffer = detach_event.buf })
          end,
        })
      end
    '';
}
