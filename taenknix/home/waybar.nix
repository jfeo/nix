{lib, ...}: let
  catppuccin-mocha-red = "#f38ba8";
  catppuccin-mocha-overlay2 = "#9399b2";
in {
  programs.waybar = {
    enable = true;
    style = builtins.readFile ./waybar.css;
  };

  programs.waybar.settings = [
    {
      # General Settings
      layer = "top";
      position = "top";
      reload_style_on_change = true;
      modules-left = [
        "sway/workspaces"
        "sway/mode"
      ];
      modules-center = ["sway/window"];
      modules-right = [
        "group/expand"
        "tray"
        "idle_inhibitor"
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
      "sway/workspaces" = {
        all-outputs = true;
        format = "{icon}";
        format-icons = builtins.listToAttrs (builtins.concatLists (builtins.map ({
          group,
          workspaces,
        }:
          builtins.map (workspace: {
            name = "${toString group}${toString workspace}";
            value = "${toString group}:${toString workspace}";
          })
          workspaces) (
          builtins.map (group: {
            workspaces = [1 2 3 4 5 6 7 8 9 0];
            group = group;
          })
          [1 2 3 4 5 6 7 8 9 0]
        )));
        disable_scroll = true;
        persistent-workspaces = {};
      };

      "sway/mode" = {
        format = "  {}";
        max-length = 50;
      };

      "sway/window" = {
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
        on-click-right = "rofi -display-run \"Output...\" -show rofi-sound -modi \"rofi-sound:rofi-sound-output-chooser\"";
        on-click = "pavucontrol";
        input = true;
      };

      "pulseaudio#source" = {
        format = "{format_source}";
        format-source = "<span foreground='${catppuccin-mocha-red}'> {volume}%</span>";
        format-source-muted = "<span foreground='${catppuccin-mocha-overlay2}'></span>";
        on-click-right = "rofi -show rofi-sound -modi \"rofi-sound:rofi-sound-input-chooser\"";
      };

      "custom/notification" = {
        tooltip = false;
        format = "";
        on-click = "swaync-client -t -sw";
        escape = true;
      };

      clock = {
        format = "{:%b %d %H:%M:%S} ";
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
        exec = "pgrep wlsunset > /dev/null && echo '{\"alt\":\"on\"}' || echo '{\"alt\":\"off\"}'";
        format = "{icon}";
        return-type = "json";
        format-icons = {
          "on" = "";
          "off" = "";
        };
        tooltip-format = "Blue light filter";
        interval = "once";
        on-click = "pgrep wlsunset > /dev/null && pkill wlsunset || (wlsunset -t 4000 &); pkill -SIGRTMIN+8 waybar";
        signal = 8;
      };

      "idle_inhibitor" = {
        format = "{icon}";
        format-icons = {
          activated = "";
          deactivated = "";
        };
        timeout = 30.5;
        tooltip-format-activated = "Idle inhibitor activated";
        tooltip-format-deactivated = "Idle inhibitor deactivated";
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
        format = "{usage:>2}% ";
        tooltip = true;
      };

      memory = {
        format = "{percentage}% ";
        tooltip-format = "{used:0.1f}GiB/{total:0.1f}GiB\n\nSwap:\n{swapUsed:0.1f}GiB/{swapTotal:0.1f}GiB";
      };

      temperature = {
        critical-threshold = 80;
        format = "{temperatureC}°C ";
      };

      tray = {
        icon-size = 14;
        spacing = 10;
      };
    }
  ];
}
