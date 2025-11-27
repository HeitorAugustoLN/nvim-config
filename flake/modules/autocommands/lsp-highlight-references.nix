{
  flake.modules.nixvim.autoCommands =
    { lib, ... }:
    {
      autoGroups."heitor/lsp_reference_highlight".clear = true;

      autoCmd = [
        {
          callback = lib.nixvim.mkRaw ''
            function()
              if vim.startswith(vim.api.nvim_get_mode().mode, "i") then
                return
              end

              local clients = vim.lsp.get_clients({ bufnr = 0 })
              local has_highlight_provider = vim.iter(clients):any(function(client)
                return client:supports_method("textDocument/documentHighlight")
              end)

              if has_highlight_provider then
                vim.lsp.buf.clear_references()
                vim.lsp.buf.document_highlight()
              end
            end
          '';
          desc = "Highlight references under cursor";
          event = "CursorMoved";
          group = "heitor/lsp_reference_highlight";
        }
        {
          callback = lib.nixvim.mkRaw ''
            function()
              vim.lsp.buf.clear_references()
            end
          '';
          desc = "Clear highlights when entering insert mode";
          event = "InsertEnter";
          group = "heitor/lsp_reference_highlight";
        }
      ];
    };
}
