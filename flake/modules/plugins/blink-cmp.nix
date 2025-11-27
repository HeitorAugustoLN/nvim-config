{
  flake.modules.nixvim.blink-cmp =
    { config, lib, ... }:
    {
      plugins.blink-cmp = {
        enable = true;

        lazyLoad.settings = {
          before = lib.nixvim.mkRaw ''
            function()
              require("lz.n").trigger_load("${lib.getName config.plugins.mini-icons.package}")
              require("lz.n").trigger_load("${lib.getName config.plugins.luasnip.package}")
            end
          '';

          event = [
            "CmdlineEnter"
            "InsertEnter"
          ];
        };

        settings = {
          completion.menu.draw = {
            components = {
              kind_icon = {
                text = lib.nixvim.mkRaw ''
                  function(ctx)
                    local kind_icon, _, _ = require("mini.icons").get("lsp", ctx.kind)
                    return kind_icon
                  end
                '';
                highlight = lib.nixvim.mkRaw ''
                  function(ctx)
                    local _, hl, _ = require("mini.icons").get("lsp", ctx.kind)
                    return hl
                  end
                '';
              };

              kind = {
                highlight = lib.nixvim.mkRaw ''
                  function(ctx)
                    local _, hl, _ = require("mini.icons").get("lsp", ctx.kind)
                    return hl
                  end
                '';
              };
            };
          };

          signature.enabled = true;
          snippets.preset = "luasnip";
        };
      };
    };
}
