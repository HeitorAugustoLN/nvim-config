{ config, ... }:
{
  plugins.treesitter = {
    enable = true;
    folding = true;
    grammarPackages = config.plugins.treesitter.package.passthru.allGrammars;
    nixvimInjections = true;

    settings = {
      highlight = {
        enable = true;
        additional_vim_regex_highlighting = [ "ruby" ];
      };
      indent = {
        enable = true;
        disable = [ "ruby" ];
      };
    };
  };
}
