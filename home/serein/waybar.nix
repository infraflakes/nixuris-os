{
  config,
  pkgs,
  ...
}: let
  scriptsDir = builtins.toString ./scripts;
in {
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        mod = "dock";
        height = 43;
        #width = 1700;
        width = 1000;
        #width = 1900;
        exclusive = true;
        passthrough = false;
        gtk-layer-shell = true;
        reload_style_on_change = true;
        margin-top = 10;
        output = ["eDP-1"];

        modules-left = [
          "custom/padd"
          "custom/l_end"
          "hyprland/workspaces"
          "custom/r_end"
          "custom/l_end"
          "hyprland/window"
          "custom/r_end"
          "custom/padd"
        ];

        modules-center = [
        ];

        modules-right = [
          "custom/padd"
          "custom/l_end"
          "cpu"
          "temperature"
          "memory"
          "custom/r_end"

          "custom/l_end"
          "pulseaudio"
          "pulseaudio#microphone"
          "backlight"
          "custom/r_end"

          "custom/padd"
        ];
        "temperature" = {
          interval = 1;
          tooltip = true;
          hwmon-path = [
            "/sys/class/hwmon/hwmon4/temp1_input"
            "/sys/class/thermal/thermal_zone5/temp"
          ];
          critical-threshold = 82;
          format-critical = "{temperatureC}°C {icon}";
          format = "{icon} {temperatureC}°C";
          format-icons = ["󰈸"];
        };
        "cpu" = {
          interval = 1;
          format = "󰍛 {usage}%";
          rotate = 0;
          format-alt = "{icon0}{icon1}{icon2}{icon3}";
          format-icons = ["▁" "▂" "▃" "▄" "▅" "▆" "▇" "█"];
        };

        "memory" = {
          states = {
            c = 90;
            h = 60;
            m = 30;
          };
          interval = 1;
          format = "󰾆 {used}GB";
          rotate = 0;
          format-m = "󰾅 {used}GB";
          format-h = "󰓅 {used}GB";
          format-c = " {used}GB";
          format-alt = "󰾆 {percentage}%";
          max-length = 10;
          tooltip = true;
          tooltip-format = "󰾆 {percentage}%\n {used:0.1f}GB/{total:0.1f}GB";
        };

        "backlight" = {
          device = "intel_backlight";
          rotate = 0;
          format = "{icon} {percent}%";
          format-icons = ["" "" "" "" ""];
          on-scroll-up = "brightnessctl set 1%+";
          on-scroll-down = "brightnessctl set 1%-";
          min-length = 6;
        };

        "hyprland/workspaces" = {
          format = "{icon}";
          format-icons = {
            active = "󱨇";
            default = "";
          };
          disable-scroll = true;
          rotate = 0;
          all-outputs = true;
          active-only = false;
          on-click = "activate";
          persistent-workspaces = {"*" = 6;};
        };

        "pulseaudio" = {
          format = "{icon} {volume}%";
          rotate = 0;
          format-muted = "󰖁";
          on-click = "pavucontrol -t 3";
          tooltip-format = "{icon} {desc} // {volume}%";
          scroll-step = 5;
          format-icons = {
            headphone = "";
            default = ["" "" ""];
          };
        };

        "pulseaudio#microphone" = {
          format = "{format_source}";
          rotate = 0;
          format-source = " {volume}%";
          format-source-muted = "";
          on-click = "pavucontrol -t 4";
          tooltip-format = "{format_source} {source_volume}%";
          scroll-step = 5;
        };

        "hyprland/window" = {
          max-length = 80;
          format = "{}";
          icon = true;
          icon-size = 18;
          separate-outputs = true;
        };

        "custom/l_end" = {
          format = " ";
          interval = "once";
          tooltip = false;
        };
        "custom/r_end" = {
          format = " ";
          interval = "once";
          tooltip = false;
        };
        "custom/padd" = {
          format = " ";
          interval = "once";
          tooltip = false;
        };
      }; #mainBar

      sideBar = {
        layer = "top";
        position = "left";
        mod = "dock";
        margin-left = 10;
        width = 53;
        #height       = 1000;
        height = 750;
        exclusive = true;
        passthrough = false;
        gtk-layer-shell = true;
        reload_style_on_change = true;
        output = ["eDP-1"];
        modules-left = [
          "custom/logo"
          "clock"
          "tray"
        ];
        modules-center = [
        ];
        modules-right = [
          #"bluetooth"

          "network"
          "custom/swaync"
          "battery"
          "custom/power"
        ];

        "custom/swaync" = {
          tooltip = false;
          format = "{icon}";
          format-icons = {
            notification = "󱅫";
            none = "󰂚";
            dnd-notification = "󱏧<span foreground='red'><sup></sup></span>";
            dnd-none = "󱏧";
            inhibited-notification = "󰂚<span foreground='red'><sup></sup></span>";
            inhibited-none = "󰂚";
            dnd-inhibited-notification = "<span foreground='red'><sup></sup></span>";
            dnd-inhibited-none = "󱏧";
          };
          return-type = "json";
          exec-if = "which swaync-client";
          exec = "swaync-client -swb";
          on-click = "swaync-client -t -sw";
          on-click-right = "swaync-client -d -sw";
          escape = true;
        };

        "custom/logo" = {
          format = " ";
          #on-click = "exec ${scriptsDir}/swww";
          on-click = "exec rofi -show drun";
        };

        "custom/power" = {
          format = "⏻";
          on-click = "exec ${scriptsDir}/session";
          tooltip = false;
        };

        "tray" = {
          icon-size = 18;
          rotate = 0;
          spacing = 10;
        };

        "network" = {
          tooltip = true;
          format-wifi = " ";
          format-alt = "  {essid}\n {bandwidthDownBytes:<1}\n {bandwidthUpBytes:<1}";
          rotate = 0;
          format-ethernet = "󰈀 ";
          format-linked = "󰈀 {ifname} (No IP)";
          format-disconnected = "󰖪 ";
          tooltip-format = "<span foreground='#86afef'>  {essid}:\n {bandwidthDownBytes}</span>\n<span foreground='#86afef'> {bandwidthUpBytes}</span>";
          interval = 1;
        };

        "bluetooth" = {
          format = "";
          format-connected = "󰂱";
          format-disabled = "󰂲";
          rotate = 0;
          format-icons = ["󰥇" "󰤾" "󰤿" "󰥀" "󰥁" "󰥂" "󰥃" "󰥄" "󰥅" "󰥆" "󰥈"];
          tooltip-format = "{controller_alias}\n{num_connections} connected";
          tooltip-format-connected = "{device_enumerate}";
        };

        "battery" = {
          states = {
            good = 95;
            warning = 30;
            critical = 20;
          };
          format = " {icon}\n{capacity}%";
          format-alt = "{time} {icon}";
          format-charging = " \n{capacity}%";
          format-plugged = " \n{capacity}%";
          format-icons = ["󰂎" "󰁺" "󰁻" "󰁼" "󰁽" "󰁾" "󰁿" "󰂀" "󰂁"];
        };

        "clock" = {
          interval = 1;
          format = "\n{:%H\n%M\n%S}";
          rotate = 0;
          format-alt = "{:%a\n%d\n%m}";
          tooltip-format = "<tt>{calendar}</tt>";
          calendar = {
            mode = "month";
            mode-mon-col = 3;
            on-scroll = 1;
            on-click-right = "mode";
            format = {
              months = "<b>{}</b>";
              weekdays = "<b>{}</b>";
              today = "<b>{}</b>";
            };
          };
          actions = {
            on-click-right = "mode";
            on-click-forward = "tz_up";
            on-click-backward = "tz_down";
            on-scroll-up = "shift_up";
            on-scroll-down = "shift_down";
          };
        };
      }; #sideBar
    }; #settings

    style = ''
          * {
          border: none;
          border-radius: 0px;
          font-family: "JetBrainsMono Nerd Font";
          font-weight: bold;
          font-size: 13px;
          min-height: 21px;
      }

      window#waybar {
          background: #1b1e25;
          border-radius: 7px;
      }

      tooltip {
          background: #1b1e25;
          border-radius: 8px;
          border-width: 0px;
      }
      tooltip label {
          font-size: 13px;
          color: #86afef;
      }
      #workspaces button {
          box-shadow: none;
      	text-shadow: none;
          padding: 0px;
          border-radius: 8px;
          margin-top: 4px;
          margin-bottom: 4px;
          margin-left: 0px;
          padding-left: 4px;
          padding-right: 4px;
          margin-right: 0px;
          color: #86afef;
          animation: ws_normal 20s ease-in-out 1;
      }
      #workspaces button.persistent{
          color: #86afef;
      }

      #workspaces button.active {
          /* background: #2B2F38; */
          color: #86afef;
          /* margin-left: 1px;
          padding-left: 4px;
          padding-right: 8px;
          margin-right: 1px; */
          animation: ws_active 20s ease-in-out 1;
          /* transition: all 0.4s cubic-bezier(.55,-0.68,.48,1.682); */
      }

      #workspaces button.persistent:nth-child(2){
          color: #86afef;
      }

      #workspaces button.persistent:nth-child(3){
          color: #86afef;
      }

      #workspaces button:hover {
          background: #86afef;
          color: #86afef;
          animation: ws_hover 20s ease-in-out 1;
          transition: all 0.3s cubic-bezier(.55,-0.68,.48,1.682);
      }

      #taskbar button {
          box-shadow: none;
      	text-shadow: none;
          padding: 0px;
          border-radius: 8px;
          margin-top: 4px;
          margin-bottom: 4px;
          margin-left: 0px;
          padding-left: 4px;
          padding-right: 4px;
          margin-right: 0px;
          animation: tb_normal 20s ease-in-out 1;
      }

      #taskbar button.active {
          background: #86afef;
          color: #86afef;
          margin-left: 2px;
          padding-left: 11px;
          padding-right: 11px;
          margin-right: 2px;
          animation: tb_active 20s ease-in-out 1;
          transition: all 0.4s cubic-bezier(.55,-0.68,.48,1.682);
      }

      #taskbar button:hover {
          background: #86afef;
          color: #86afef;
          animation: tb_hover 20s ease-in-out 1;
          transition: all 0.3s cubic-bezier(.55,-0.68,.48,1.682);
      }
      #temperature,
      #backlight,
      #cpu,
      #memory,
      #pulseaudio,
      #window,
      #workspaces,
      #custom-l_end,
      #custom-r_end{
          color: #86afef;
          font-size: 14;
          background: #242830;
          opacity: 1;
          margin: 6px 0px 6px 0px;
          padding-left: 4px;
          padding-right: 4px;
      }

      #tray menu *{
        color: #86afef;
        background: #1b1e25;
      }
      #custom-logo,
      #clock,
      #custom-power,
      #custom-swaync,
      #tray,
      #network,
      #bluetooth,
      #battery{
          color: #86afef;
          font-size: 14;
          background: #242830;
          opacity: 1;
          border: none;
          border-radius: 6px;
          margin-left: 5px;
          margin-right: 5px;
          margin-top: 5px;
          margin-bottom: 5px;
          padding-top: 10px;
          padding-bottom: 10px;
      }
      backlight,
      #memory,
      #clock,
      #idle_inhibitor,
      #blueooth,
      #pulseaudio,
      #cpu{
          color: #86afef;
      }

      #custom-logo{
          color:#1b1e25;
          background: #86afef;
          font-size: 23;
          padding-left: 4px;
          padding-top: 5px;
          padding-bottom: 5px;
      }

      #network{
        font-size: 14;
        padding-left: 5px;
        padding-right: 5px;

      }
      #workspaces{
          padding: 0px;
      }

      #custom-r_end {
          border-radius: 0px 5px 5px 0px;
          margin-right: 8px;
          padding-right: 0px;
      }

      #custom-l_end {
          border-radius: 5px 0px 0px 5px;
          margin-left: 8px;
          padding-left: 0px;
      }
    '';
  }; #programs.waybar
}
