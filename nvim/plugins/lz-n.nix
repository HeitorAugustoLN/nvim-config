{ inputs', ... }:
{
  plugins.lz-n = {
    enable = true;
    package = inputs'.lz-n.packages.default;
  };
}
