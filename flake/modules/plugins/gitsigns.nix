{
  flake.modules.nixvim.gitsigns.plugins.gitsigns = {
    enable = true;

    lazyLoad.settings.event = [
      "BufNewFile"
      "BufReadPost"
      "BufWritePost"
    ];

    settings.signs = {
      add.text = "+";
      change.text = "~";
      changedelete.text = "~";
      delete.text = "_";
      topdelete.text = "‾";
      untracked.text = "┆";
    };
  };
}
