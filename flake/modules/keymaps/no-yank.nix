{
  flake.modules.nixvim.keymaps.keymaps = [
    {
      mode = [
        "n"
        "v"
      ];
      key = "<A-d>";
      action = ''"_d'';
      options.desc = "Delete without yanking";
    }
    {
      mode = [
        "n"
        "v"
      ];
      key = "<A-c>";
      action = ''"_c'';
      options.desc = "Change without yanking";
    }
    {
      mode = [
        "n"
        "v"
      ];
      key = "<A-D>";
      action = ''"_D'';
      options.desc = "Delete to end of line without yanking";
    }
    {
      mode = [
        "n"
        "v"
      ];
      key = "<A-C>";
      action = ''"_C'';
      options.desc = "Change to end of line without yanking";
    }
  ];
}
