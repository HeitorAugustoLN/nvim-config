{
  flake.modules.nixvim.diagnostic = {
    diagnostic.settings = {
      virtual_lines = {
        enable = true;
        current_line = true;
      };
      virtual_text = {
        enable = true;
        current_line = false;
      };
    };
  };
}
