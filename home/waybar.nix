{ ... }:
let
  catppuccin-mocha-red = "#f38ba8";
  catppuccin-mocha-overlay2 = "#9399b2";
in
{
  programs.waybar = {
    enable = true;
    style = (builtins.readFile ./waybar.css);
  };

  programs.waybar.settings = [
    {
      # General Settings
      layer = "top";
      position = "top";
      reload_style_on_change = true;
      modules-left = [
        "hyprland/workspaces"
      ];
      modules-center = [ "hyprland/window" ];
      modules-right = [
        "group/expand"
        "tray"
        "custom/sunset"
        "pulseaudio#audio"
        "pulseaudio#source"
        "battery"
        "power-profiles-daemon"
        "clock"
        "custom/power"
        "custom/notification"
      ];

      # Module Configurations
      "hyprland/workspaces" = {
        persistent-workspaces = {
          "*" = [
            1
            2
            3
            4
            5
          ];
        };
      };

      "hyprland/window" = {
        separate-outputs = true;
      };

      power-profiles-daemon = {
        format = "{icon}";
        tooltip-format = "Power profile: {profile}\nDriver: {driver}";
        tooltip = true;
        format-icons = {
          default = "";
          performance = "";
          balanced = "";
          power-saver = "";
        };
      };

      "pulseaudio#audio" = {
        format = "{icon}   {volume}%";
        format-muted = "<span foreground='${catppuccin-mocha-overlay2}'></span>";
        format-icons = {
          headphone = "";
          phone = "";
          portable = "";
          default = [
            ""
            ""
            ""
          ];
        };
        on-click = "pavucontrol";
        input = true;
      };

      "pulseaudio#source" = {
        format = "{format_source}";
        format-source = "<span foreground='${catppuccin-mocha-red}'> {volume}%</span>";
        format-source-muted = "<span foreground='${catppuccin-mocha-overlay2}'></span>";
      };

      "custom/notification" = {
        tooltip = false;
        format = "";
        on-click = "swaync-client -t -sw";
        escape = true;
      };

      clock = {
        format = "{:%H:%M:%S} ";
        interval = 1;
        tooltip-format = "<tt>{calendar}</tt>";
        calendar = {
          format = {
            today = "<span color='#fAfBfC'><b>{}</b></span>";
          };
        };
        actions = {
          on-click-right = "shift_down";
          on-click = "shift_up";
        };
      };

      battery = {
        interval = 30;
        states = {
          good = 95;
          warning = 20;
          critical = 10;
        };
        format = "{capacity}% {icon}";
        format-charging = "{capacity}% 󰂄";
        format-plugged = "{capacity}% 󰂄 ";
        format-alt = "{time} {icon}";
        format-icons = [
          "󰁻"
          "󰁼"
          "󰁾"
          "󰂀"
          "󰂂"
          "󰁹"
        ];
      };

      "custom/expand" = {
        format = "";
        tooltip = false;
      };

      "custom/endpoint" = {
        format = "|";
        tooltip = false;
      };

      "custom/sunset" = {
        exec = "hyprctl hyprsunset temperature | jq --unbuffered --compact-output -Rn '{alt: input}'";
        format = "{icon}";
        return-type = "json";
        format-icons = {
          "4000" = "";
          default = "";
        };
        tooltip-format = "Blue light filter";
        interval = "once";
        on-click = "hyprctl hyprsunset temperature | grep -q 4000 && hyprctl hyprsunset temperature 6500 || hyprctl hyprsunset temperature 4000; pkill -SIGRTMIN+8 waybar";
        signal = 8;
      };

      "custom/power" = {
        format = "󰐥";
        tooltip = false;
        on-click = "rofi -show p -modi p:'rofi-power-menu' -theme-str 'window {width: 20em;} listview {lines: 6;}'";
      };

      "group/expand" = {
        orientation = "horizontal";
        drawer = {
          transition-duration = 600;
          transition-to-left = true;
          click-to-reveal = true;
        };
        modules = [
          "custom/expand"
          "cpu"
          "memory"
          "temperature"
          "custom/endpoint"
        ];
      };

      cpu = {
        format = "󰻠";
        tooltip = true;
      };

      memory = {
        format = "";
      };

      temperature = {
        critical-threshold = 80;
        rmat = "";
      };

      tray = {
        icon-size = 14;
        spacing = 10;
      };
    }
  ];

}
