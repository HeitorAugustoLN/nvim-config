{ config, ... }:
{
  globals = {
    autoformat = true;

    loaded_node_provider = 0;
    loaded_perl_provider = 0;
    loaded_python_provider = 0;
    loaded_python3_provider = 0;
    loaded_ruby_provider = 0;

    mapleader = " ";
    maplocalleader = " ";
  };

  withNodeJs = config.globals.loaded_node_provider == 1;
  withPerl = config.globals.loaded_perl_provider == 1;
  withPython3 = config.globals.loaded_python3_provider == 1;
  withRuby = config.globals.loaded_ruby_provider == 1;
}
