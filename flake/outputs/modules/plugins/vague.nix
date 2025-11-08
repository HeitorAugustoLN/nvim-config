{
  flake.modules.nixvim.vague =
    { pkgs, ... }:
    {
      extraPlugins = [ pkgs.vimPlugins.vague-nvim ];
      colorscheme = "vague";
    };
}
