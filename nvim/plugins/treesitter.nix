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
      lazy.__raw = "vim.fn.argc(-1) == 0";
      event = [
        "BufNewFile"
        "BufReadPost"
        "BufWritePost"
        "DeferredUIEnter"
      ];
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
