{
  flake.modules.nixvim.clipboard-providers =
    { lib, pkgs, ... }:
    {
      clipboard.providers.wl-copy.enable = lib.mkIf pkgs.stdenv.hostPlatform.isLinux true;
    };
}
