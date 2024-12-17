{ lib, pkgs, ... }:
{
  plugins.conform-nvim = {
    enable = true;
    lazyLoad.settings = {
      cmd = "ConformInfo";
      event = "BufWritePre";
      keys = [
        {
          __unkeyed-1 = "<leader>f";
          __unkeyed-2.__raw = ''
            function()
              require("conform").format({ async = true, lsp_format = "fallback" })
            end
          '';
          mode = [
            "n"
            "v"
          ];
          desc = "Format buffer";
        }
      ];
    };

    settings = {
      format_on_save.__raw = ''
        function(bufnr)
          if not (vim.g.autoformat or vim.b[bufnr].autoformat) then
            return
          end

          return { timeout_ms = 500, lsp_format = "fallback" }
        end
      '';

      formatters = {
        nixfmt = {
          command = lib.getExe pkgs.nixfmt-rfc-style;
        };
        ruff_fix = {
          command = lib.getExe pkgs.ruff;
        };
        ruff_format = {
          command = lib.getExe pkgs.ruff;
        };
        ruff_organize_imports = {
          command = lib.getExe pkgs.ruff;
        };
        rustfmt = {
          command = lib.getExe pkgs.rustfmt;
        };
        squeeze_blanks = {
          command = lib.getExe' pkgs.coreutils "cat";
        };
        stylua = {
          command = lib.getExe pkgs.stylua;
        };
      };

      formatters_by_ft = {
        _ = [
          "squeeze_blanks"
          "trim_whitespace"
        ];
        lua = [ "stylua" ];
        nix = [ "nixfmt" ];
        python = [
          "ruff_fix"
          "ruff_format"
          "ruff_organize_imports"
        ];
        rust = [ "rustfmt" ];
      };

      notify_on_error = false;
    };
  };

  userCommands = {
    FormatDisable = {
      bang = true;
      command.__raw = ''
        function(args)
          if args.bang then
            vim.b.autoformat = false
            vim.notify("Automatic formatting on save is now disabled for this buffer.", vim.log.levels.INFO)
          else
            vim.g.autoformat = false
            vim.notify("Automatic formatting on save is now disabled.", vim.log.levels.INFO)
          end
        end
      '';
      desc = "Disable automatic formatting on save";
    };

    FormatEnable = {
      bang = true;
      command.__raw = ''
        function(args)
          if args.bang then
            vim.b.autoformat = true
            vim.notify("Automatic formatting on save is now enabled for this buffer.", vim.log.levels.INFO)
          else
            vim.g.autoformat = true
            vim.notify("Automatic formatting on save is now enabled.", vim.log.levels.INFO)
          end
        end
      '';
      desc = "Enable automatic formatting on save";
    };

    FormatToggle = {
      bang = true;
      command.__raw = ''
        function(args)
          if args.bang then
            vim.b.autoformat = not vim.b.autoformat

            if vim.b.autoformat then
              vim.notify("Automatic formatting on save is now enabled for this buffer.", vim.log.levels.INFO)
            else
              vim.notify("Automatic formatting on save is now disabled for this buffer.", vim.log.levels.INFO)
            end
          else
            vim.g.autoformat = not vim.g.autoformat

            if vim.g.autoformat then
              vim.notify("Automatic formatting on save is now enabled.", vim.log.levels.INFO)
            else
              vim.notify("Automatic formatting on save is now disabled.", vim.log.levels.INFO)
            end
          end
        end
      '';
      desc = "Toggle automatic formatting on save";
    };
  };
}
