{pkgs, ...}: let
  brightnessctl = "${pkgs.brightnessctl}/bin/brightnessctl";
  loginctl = "${pkgs.systemd}/bin/loginctl";
  swaymsg = "${pkgs.sway}/bin/swaymsg";
  systemctl = "${pkgs.systemd}/bin/systemctl";
in {
  services.swayidle = {
    enable = true;
    events = {
      before-sleep = "${loginctl} lock-session";
      after-resume = "${swaymsg} 'output * dpms on'";
    };
    timeouts = [
      # set monitor backlight to minimum
      {
        timeout = 150;
        command = "${brightnessctl} -s set 10";
        resumeCommand = "${brightnessctl} -r";
      }
      # turn off keyboard backlight
      {
        timeout = 150;
        command = "${brightnessctl} -sd rgb:kbd_backlight set 0";
        resumeCommand = "${brightnessctl} -rd rgb:kbd_backlight";
      }
      # lock screen
      {
        timeout = 300;
        command = "${loginctl} lock-session";
      }
      # screen off
      {
        timeout = 330;
        command = "${swaymsg} 'output * dpms off'";
        resumeCommand = "${swaymsg} 'output * dpms on' && ${brightnessctl} -r";
      }
      # suspend
      {
        timeout = 1800;
        command = "${systemctl} suspend";
      }
    ];
  };
}
