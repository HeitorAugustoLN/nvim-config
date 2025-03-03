{
  plugins.mini = {
    enable = true;
    lazyLoad.settings.event = "DeferredUIEnter";
    mockDevIcons = true;

    modules = {
      ai = {
        n_lines = 500;
      };

      icons = { };

      pairs = {
        markdown = true;

        modes = {
          command = true;
          insert = true;
          terminal = true;
        };

        skip_next.__raw = ''[=[[%w%%%'%[%"%.%`%$]]=]'';
        skip_ts = [ "string" ];
        skip_unbalanced = true;
      };
    };
  };
}
