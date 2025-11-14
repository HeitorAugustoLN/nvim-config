{
  flake.modules.nixvim.statuscol =
    { lib, ... }:
    {
      plugins.statuscol = {
        enable = true;
        lazyLoad.settings.event = "DeferredUIEnter";

        settings.segments = [
          {
            text = [ "%s" ];
            click = "v:lua.ScSa";
          }
          {
            text = [ (lib.nixvim.mkRaw "require('statuscol.builtin').lnumfunc") ];
            click = "v:lua.ScLa";
          }
          {
            text = [
              " "
              (lib.nixvim.mkRaw "require('statuscol.builtin').foldfunc")
              " "
            ];
            condition = [
              (lib.nixvim.mkRaw "require('statuscol.builtin').not_empty")
              true
              (lib.nixvim.mkRaw "require('statuscol.builtin').not_empty")
            ];
            click = "v:lua.ScFa";
          }
        ];
      };
    };
}
