{
  flake.modules.nixvim.godot =
    { pkgs, ... }:
    {
      lsp.servers.gdscript.enable = true;

      plugins = {
        conform-nvim.settings.formatters_by_ft.gdscript = [ "gdformat" ];

        dap = {
          adapters.servers.godot = {
            host = "127.0.0.1";
            port = 6006;
          };

          configurations.gdscript = [
            {
              type = "godot";
              request = "launch";
              name = "Launch scene";
              project = "\${workspaceFolder}";
            }
          ];
        };

        lint.lintersByFt.gdscript = [ "gdlint" ]; # Linter already installed by conform

        treesitter.grammarPackages = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
          gdscript
          gdshader
          godot_resource
        ];
      };

      extraConfigLua = ''
        local function get_godot_project_root()
          local current_file = vim.fn.expand("%:p")
          local search_dir = vim.fn.fnamemodify(current_file, ":h")

          if current_file == "" then
            search_dir = vim.fn.getcwd()
          end

          local found = vim.fs.find("project.godot", {
            path = search_dir,
            upward = true,
            type = "file",
            limit = 1,
          })

          if #found > 0 then
            return vim.fn.fnamemodify(found[1], ":h")
          end

          return nil
        end

        local godot_project_root = get_godot_project_root()

        if godot_project_root then
          local server_pipe = godot_project_root .. '/server.pipe'
          local is_server_running = vim.uv.fs_stat(server_pipe) ~= nil

          if not is_server_running then
            vim.fn.serverstart(server_pipe)
          end
        end
      '';
    };
}
