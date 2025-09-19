{ ... }:
{
  programs.waybar = {
    enable = true;
    style = (builtins.readFile ../waybar/style.css);
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
        "battery"
        "pulseaudio"
        "power-profiles-daemon"
        "clock"
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
        default = "";
        performance = "";
        balanced = "";
        power-saver = "";
      };

      pulseaudio = {
        format = "<span foreground='#cc241d'>{icon}</span> {volume}%  {format_source}";
        format-bluetooth = "<span foreground='#b16286'>{icon}</span> {volume}%  {format_source}";
        format-bluetooth-muted = "<span foreground='#D699B6'>󰖁</span> {format_source}";
        format-muted = "<span foreground='#7A8478'>󰖁</span> {format_source}";
        format-source = "<span foreground='#E67E80'></span> {volume}%";
        format-source-muted = "<span foreground='#F38BA8'></span>";
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

      "custom/notification" = {
        tooltip = false;
        format = "";
        on-click = "swaync-client -t -sw";
        escape = true;
      };

      clock = {
        format = "{:%I:%M:%S %p} ";
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
          warning = 30;
          critical = 20;
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
