{ lib, ... }:
{
  flake.modules.nixvim.leader.globals =
    [
      "mapleader"
      "maplocalleader"
    ]
    |> map (with lib; flip nameValuePair " ")
    |> builtins.listToAttrs;
}
