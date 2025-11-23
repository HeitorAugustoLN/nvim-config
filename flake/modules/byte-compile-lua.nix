{
  flake.modules.nixvim.byteCompileLua = {
    performance.byteCompileLua = {
      enable = false;
      configs = true;
      initLua = true;
      luaLib = true;
      nvimRuntime = true;
      plugins = true;
    };
  };
}
