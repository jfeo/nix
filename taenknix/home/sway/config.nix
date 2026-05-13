{pkgs, ...}: {
  wayland.windowManager.sway = {
    enable = true;
    package = pkgs.swayfx;
    xwayland = true;
    systemd.enable = true;
    checkConfig = false;

    config = {
      modifier = "Mod4"; # Super key
      terminal = "alacritty";
      defaultWorkspace = "1";

      # Output (monitor) configuration
      output = {
        "eDP-1" = {
          resolution = "1920x1200@60Hz";
          position = "0 0";
        };

        # Office monitors
        "Dell Inc. DELL P2416D 07C536BP0FPL" = {
          position = "-2560 0"; # Adjust based on Dell's actual resolution
        };
        "Microstep MSI MP273A PB4HA74400993" = {
          resolution = "1920x1080@60Hz";
          position = "0 -1080";
        };
      };

      # Input configuration
      input = {
        "type:keyboard" = {
          xkb_layout = "dk";
        };
        "type:touchpad" = {
          natural_scroll = "enabled";
          accel_profile = "flat";
          pointer_accel = "0.5";
        };
      };

      # Appearance
      gaps.inner = 5;
      window.border = 2;
      focus.followMouse = true;

      # Startup applications
      startup = [
        {
          command = "nm-applet --indicator";
        }
        {
          command = "${pkgs.swaybg}/bin/swaybg -i /home/feo/Downloads/IMG_20250814_172041_rotated.jpg -m fill";
          always = true;
        }
      ];

      # Keybindings
      keybindings = let
        mod = "Mod4";
      in {
        # General
        "${mod}+Return" = "exec alacritty";
        "${mod}+Shift+q" = "kill";
        "${mod}+Shift+e" = "exec swaynag -t warning -m 'Exit sway?' -B 'Yes' 'swaymsg exit'";
        "${mod}+Shift+Alt+l" = "exec ${pkgs.swaylock}/bin/swaylock";
        "${mod}+z" = "exec ${pkgs.rofi}/bin/rofi -show p -modi p:'rofi-power-menu' -theme-str 'window {width: 20em;} listview {lines: 6;}'";

        # Layout and splitting
        "${mod}+s" = "split toggle";
        "${mod}+Shift+a" = "layout stacking";
        "${mod}+Shift+s" = "layout toggle split";
        "${mod}+Shift+d" = "layout tabbed";

        # Screen focus
        "${mod}+Shift+space" = "floating toggle";
        "${mod}+u" = "[urgent=latest] focus";
        "${mod}+tab" = "workspace back_and_forth";
        "${mod}+f" = "fullscreen toggle";

        # Workspaces
        "${mod}+1" = "workspace number 1";
        "${mod}+2" = "workspace number 2";
        "${mod}+3" = "workspace number 3";
        "${mod}+4" = "workspace number 4";
        "${mod}+5" = "workspace number 5";
        "${mod}+6" = "workspace number 6";
        "${mod}+7" = "workspace number 7";
        "${mod}+8" = "workspace number 8";
        "${mod}+9" = "workspace number 9";
        "${mod}+0" = "workspace number 10";

        # Move to workspaces
        "${mod}+Shift+1" = "move container to workspace number 1";
        "${mod}+Shift+2" = "move container to workspace number 2";
        "${mod}+Shift+3" = "move container to workspace number 3";
        "${mod}+Shift+4" = "move container to workspace number 4";
        "${mod}+Shift+5" = "move container to workspace number 5";
        "${mod}+Shift+6" = "move container to workspace number 6";
        "${mod}+Shift+7" = "move container to workspace number 7";
        "${mod}+Shift+8" = "move container to workspace number 8";
        "${mod}+Shift+9" = "move container to workspace number 9";
        "${mod}+Shift+0" = "move container to workspace number 10";

        # Navigation
        "${mod}+h" = "focus left";
        "${mod}+l" = "focus right";
        "${mod}+k" = "focus up";
        "${mod}+j" = "focus down";
        "${mod}+Shift+h" = "move left";
        "${mod}+Shift+l" = "move right";
        "${mod}+Shift+k" = "move up";
        "${mod}+Shift+j" = "move down";

        # Resize
        "${mod}+Control+h" = "resize shrink width 20px";
        "${mod}+Control+l" = "resize grow width 20px";
        "${mod}+Control+k" = "resize shrink height 20px";
        "${mod}+Control+j" = "resize grow height 20px";

        # Screenshots
        "Print" = "exec screenshot";
        "Shift+Print" = "exec screenshot --area";
        "${mod}+Print" = "exec screenshot --save";
        "${mod}+Shift+Print" = "exec screenshot --area --save";

        # Applications
        "${mod}+Alt+f" = "exec ${pkgs.firefox}/bin/firefox";
        "${mod}+Alt+o" = "exec ${pkgs.obsidian}/bin/obsidian";
        "${mod}+r" = "exec pkill rofi || ${pkgs.rofi}/bin/rofi -show drun";
        "${mod}+Shift+r" = "exec pkill rofi || ${pkgs.rofi}/bin/rofi -show run";
        "${mod}+o" = "exec pkill rofi || rofi-file-browser";

        # Media keys
        "XF86AudioRaiseVolume" = "exec swayosd-client --max-volume 150 --output-volume +5";
        "XF86AudioLowerVolume" = "exec swayosd-client --max-volume 150 --output-volume -5";
        "XF86AudioMute" = "exec swayosd-client --output-volume mute-toggle";
        # TODO: workaround while swayosd-client --input-volume mute-toggle does
        # not work see: https://github.com/ErikReider/SwayOSD/issues/225
        "XF86AudioMicMute" = ''exec sh -c 'wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle && (wpctl get-volume @DEFAULT_AUDIO_SOURCE@ | grep -q MUTED && swayosd-client --custom-message "Microphone" --custom-icon "source-volume-muted-symbolic" || swayosd-client --custom-message "Microphone" --custom-icon "source-volume-high-symbolic")' '';
        "XF86AudioPlay" = "exec swayosd-client --playerctl=play-pause";
        "XF86AudioPause" = "exec swayosd-client --playerctl=play-pause";
        "XF86AudioNext" = "exec swayosd-client --playerctl=next";
        "XF86AudioPrev" = "exec swayosd-client --playerctl=previous";
        "XF86MonBrightnessDown" = "exec swayosd-client --brightness=lower";
        "XF86MonBrightnessUp" = "exec swayosd-client --brightness=raise";
      };

      bars = [
        {
          command = "${pkgs.waybar}/bin/waybar";
        }
      ];
    };

    # Additional sway config for opacity/effects
    extraConfig = ''
      # Opacity settings
      for_window [class=".*"] opacity 0.9
      for_window [app_id=".*"] opacity 0.9
      for_window [class=".*" floating] opacity 0.8
      for_window [app_id=".*" floating] opacity 0.8

      # Window borders
      default_border pixel 2
      default_floating_border pixel 2

      # Gestures (requires libinput-gestures)
      bindgesture swipe:3:right workspace prev
      bindgesture swipe:3:left workspace next
    '';
  };
}
