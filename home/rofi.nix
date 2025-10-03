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
      display-drun = "";
      drun-display-format = "{icon} {name}";
      disable-history = false;
    };

    window = {
      border = mkLiteral "3px";
      border-radius = mkLiteral "10px";
      border-color = mkLiteral "@lavender";
      width = mkLiteral "40em";
      padding = mkLiteral "5px";
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

    textbox-prompt-colon = {
      str = "";
    };

    prompt = {
      padding = mkLiteral "0 10px 0 0 ";
    };

    inputbar = {
      padding = mkLiteral "5px";
    };

    entry = {
      placeholder = "Run...";
    };

    scrollbar = {
      handle-width = mkLiteral "5px";
      handle-rounded-corners = true;
    };
  };
}
