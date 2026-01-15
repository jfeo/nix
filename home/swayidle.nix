{pkgs, ...}: {
  services.swayidle = {
    enable = true;
    events = {
      before-sleep = "${pkgs.systemd}/bin/loginctl lock-session";
      after-resume = "${pkgs.sway}/bin/swaymsg 'output * dpms on'";
    };
    timeouts = [
      # set monitor backlight to minimum
      {
        timeout = 150;
        command = "${pkgs.brightnessctl}/bin/brightnessctl -s set 10";
        resumeCommand = "${pkgs.brightnessctl}/bin/brightnessctl -r";
      }
      # turn off keyboard backlight
      {
        timeout = 150;
        command = "${pkgs.brightnessctl}/bin/brightnessctl -sd rgb:kbd_backlight set 0";
        resumeCommand = "${pkgs.brightnessctl}/bin/brightnessctl -rd rgb:kbd_backlight";
      }
      # lock screen
      {
        timeout = 300;
        command = "${pkgs.systemd}/bin/loginctl lock-session";
      }
      # screen off
      {
        timeout = 330;
        command = "${pkgs.sway}/bin/swaymsg 'output * dpms off'";
        resumeCommand = "${pkgs.sway}/bin/swaymsg 'output * dpms on' && ${pkgs.brightnessctl}/bin/brightnessctl -r";
      }
      # suspend
      {
        timeout = 1800;
        command = "${pkgs.systemd}/bin/systemctl suspend";
      }
    ];
  };
}
