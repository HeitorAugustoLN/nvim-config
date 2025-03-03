{
  config,
  lib,
  pkgs,
  ...
}:
{
  plugins = {
    blink-cmp = {
      enable = true;
      package = pkgs.vimPlugins.blink-cmp.overrideAttrs {
        preInstall =
          let
            ext = pkgs.stdenv.hostPlatform.extensions.sharedLibrary;
          in
          ''
            mkdir -p target/release
            ln -s ${pkgs.vimPlugins.blink-cmp.blink-fuzzy-lib}/lib/libblink_cmp_fuzzy${ext} target/release/libblink_cmp_fuzzy${ext}
            echo -n "nix" > target/release/version
          '';

        patches = [
          (pkgs.fetchpatch {
            name = "blink-add-bypass-for-nix.patch";
            url = "https://github.com/Saghen/blink.cmp/commit/6c83ef1ae34abd7ef9a32bfcd9595ac77b61037c.diff?full_index=1";
            hash = "sha256-304F1gDDKVI1nXRvvQ0T1xBN+kHr3jdmwMMp8CNl+GU=";
          })
        ];

      };
      lazyLoad.settings = {
        before.__raw = ''
          function()
            require("lz.n").trigger_load("blink-compat")
            ${lib.optionalString config.plugins.luasnip.enable ''require("lz.n").trigger_load("luasnip")''}
            -- HACK: Module always gets required by blink.cmp even when not needed, so we load it before anyways
            require("lz.n").trigger_load("lazydev.nvim")
          end
        '';
        event = "DeferredUIEnter";
      };

      settings = {
        appearance = {
          nerd_font_variant = "mono";
          use_nvim_cmp_as_default = false;
        };

        completion = {
          accept = {
            auto_brackets = {
              enabled = true;
            };
          };

          documentation = {
            auto_show = true;
            auto_show_delay_ms = 200;
            window.border = "rounded";
          };

          ghost_text = {
            enabled = true;
          };

          menu.border = "rounded";
        };

        fuzzy.prebuilt_binaries.download = false;

        signature = {
          enabled = true;
          window.border = "rounded";
        };

        snippets.preset = lib.mkIf config.plugins.luasnip.enable "luasnip";

        sources =
          let
            default = [
              "lsp"
              "path"
              "snippets"
              "buffer"
            ];
          in
          {
            inherit default;
            per_filetype = {
              lua = [ "lazydev" ] ++ default;
            };

            providers = {
              lazydev = {
                name = "LazyDev";
                module = "lazydev.integrations.blink";
                score_offset = 100;
              };
            };
          };
      };
    };

    blink-compat = {
      enable = true;
      lazyLoad.settings.lazy = true;
    };

    lazydev = {
      enable = true;
      lazyLoad.settings = {
        cmd = "LazyDev";
        ft = "lua";
      };

      settings.library = [
        {
          path = "${pkgs.vimPlugins.luvit-meta}/luv/library";
          words = [ "vim%.uv" ];
        }
      ];
    };

    lsp.capabilities = ''
      capabilities = require("blink.cmp").get_lsp_capabilities(capabilities)
    '';
  };
}
