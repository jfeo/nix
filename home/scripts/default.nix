{pkgs, ...}: let
  screenshot = pkgs.writeShellApplication {
    name = "screenshot";
    runtimeInputs = with pkgs; [grim slurp sway jq wl-clipboard libnotify];
    text = builtins.readFile ./screenshot.sh;
  };

  rofi-sound-output-chooser = pkgs.writeShellApplication {
    name = "rofi-sound-output-chooser";
    runtimeInputs = with pkgs; [pulseaudioFull libnotify];
    text = builtins.readFile ./rofi-sound-output-chooser.sh;
  };

  rofi-sound-input-chooser = pkgs.writeShellApplication {
    name = "rofi-sound-input-chooser";
    runtimeInputs = with pkgs; [pulseaudioFull libnotify];
    text = builtins.readFile ./rofi-sound-input-chooser.sh;
  };
in {
  home.packages = [screenshot rofi-sound-output-chooser rofi-sound-input-chooser];
}
