{ ... }:
{
  services.hypridle.enable = true;
  services.hypridle.settings.general = {
    lock_cmd = "pidof hyprlock || hyprlock";
    before_sleep_cmd = "loginctl lock-session";
    after_sleep_cmd = "hyprctl dispatch dpms on";
  };
  services.hypridle.settings.listener = [
    # set monitor backlight to minimum, avoid 0 on OLED monitor.
    {
      timeout = 150;
      on-timeout = "brightnessctl -s set 10";
      on-resume = "brightnessctl -r";
    }

    # turn off keyboard backlight.
    {
      timeout = 150;
      on-timeout = "brightnessctl -sd rgb:kbd_backlight set 0";
      on-resume = "brightnessctl -rd rgb:kbd_backlight";
    }

    # lock screen when timeout has passed
    {
      timeout = 300;
      on-timeout = "loginctl lock-session";
    }

    # screen off when timeout has passed
    {
      timeout = 330;
      on-timeout = "hyprctl dispatch dpms off";
      on-resume = "hyprctl dispatch dpms on && brightnessctl -r";
    }

    # suspend after 30 minutes
    {
      timeout = 1800;
      on-timeout = "systemctl suspend"; # suspend pc
    }
  ];
}
