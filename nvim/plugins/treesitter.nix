{ config, ... }:
{
  plugins.treesitter = {
    enable = true;

    lazyLoad.settings = {
      cmd = [
        "TSInstall"
        "TSUpdate"
        "TSUpdateSync"
      ];

      event = [
        "BufNewFile"
        "BufReadPost"
        "BufWritePost"
        "DeferredUIEnter"
      ];

      lazy.__raw = "vim.fn.argc(-1) == 0";
    };

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
