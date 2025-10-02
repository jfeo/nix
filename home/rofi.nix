{ config, ... }:
let
  inherit (config.lib.formats.rasi) mkLiteral;
in
{
  programs.rofi.enable = true;

  programs.rofi.theme = {
    "@theme" = "catppuccin-default";
    "@import" = "catppuccin-mocha";

    configuration = {
      show-icons = true;
    };

    window = {
      border = mkLiteral "2px";
      border-radius = mkLiteral "5px";
      width = mkLiteral "40em";
    };

    message = {
      border = mkLiteral "2px solid 0px 0px";
    };

    listview = {
      border = mkLiteral "2px solid 0px 0px";
    };

    element = {
      border-radius = mkLiteral "5px";
      margin = mkLiteral "2px";
      padding = mkLiteral "5px";
    };
  };
}
