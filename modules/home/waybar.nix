{
  config,
  pkgs,
  ...
}: let
  scriptsDir = builtins.toString ../../scripts;
in {
  programs.waybar = {
    enable = true;

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
      #window,
      #custom-cava,
      #custom-power,
      #custom-swaync,
      #custom-logo,
      #backlight,
      #battery,
      #bluetooth,
      #custom-cliphist,
      #clock,
      #cpu,
      #idle_inhibitor,
      #custom-keybindhint,
      #language,
      #memory,
      #mpris,
      #network,
      #custom-power,
      #pulseaudio,
      #custom-spotify,
      #taskbar,
      #custom-theme,
      #tray,
      #custom-updates,
      #custom-wallchange,
      #custom-wbar,
      #window,
      #workspaces,
      #custom-l_end,
      #custom-r_end,
      #custom-sl_end,
      #custom-sr_end,
      #custom-rl_end,
      #custom-rr_end {
          color: #86afef;
          font-size: 14;
          background: #242830;
          opacity: 1;
          margin: 6px 0px 6px 0px;
          padding-left: 4px;
          padding-right: 4px;

      }

      /*#custom-logo {
          color: #86afef;
          background: #242830;
          font-size: 20;
          opacity: 1;
          margin: 6px 0px 6px 0px;
          padding-left: 4px;
          padding-right: 4px;

      }*/

      #tray menu *{
        color: #86afef;
        background: #1b1e25;
      }


      #backlight,
      #battery{
          color: #86afef;
      }
      #memory,
      #clock,
      #idle_inhibitor{
          color: #86afef;
      }
      #custom-power{
          padding-right: 8px;
      }
      #network,
      #blueooth,
      #pulseaudio,
      #cpu{
          color: #86afef;
      }

      #idle_inhibitor{
          padding-right: 14px;
      }

      #custom-logo{
          color:#1b1e25;
          background: #86afef;
          padding-right: 15px;
          font-size: 20px;
          padding-left: 15px;
          border-radius: 5px;
          margin-top: 7.5px;
          margin-bottom: 7.5px;
      }

      #workspaces,
      #taskbar {
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

      #custom-sr_end {
          border-radius: 0px;
          margin-right: 8px;
          padding-right: 0px;
      }

      #custom-sl_end {
          border-radius: 0px;
          margin-left: 8px;
          padding-left: 0px;
      }

      #custom-rr_end {
          border-radius: 0px 7px 7px 0px;
          margin-right: 8px;
          padding-right: 0px;
      }

      #custom-rl_end {
          border-radius: 7px 0px 0px 7px;
          margin-left: 8px;
          padding-left: 0px;
      }

    '';

    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        mod = "dock";
        height = 43;
        exclusive = true;
        passthrough = false;
        gtk-layer-shell = true;
        reload_style_on_change = true;
        width = 1900;
        margin-top = 10;
        output = ["eDP-1"];

        modules-left = [
          "custom/padd"
          "custom/padd"
          "custom/logo"
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
          "custom/padd"
          "custom/l_end"
          "idle_inhibitor"
          "clock"
          "custom/r_end"
          "custom/l_end"
          "custom/swaync"
          "custom/r_end"
          "custom/padd"
        ];

        modules-right = [
          "custom/padd"
          "custom/l_end"
          "pulseaudio"
          "pulseaudio#microphone"
          "custom/r_end"
          "backlight"
          "battery"
          "custom/r_end"
          "custom/padd"
          "custom/l_end"
          "custom/power"
          "custom/r_end"
          "custom/padd"
        ];

        "custom/power" = {
          format = " ⏻ ";
          on-click = "${scriptsDir}/session";
          tooltip = false;
        };

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

        "idle_inhibitor" = {
          format = "{icon}";
          rotate = 0;
          format-icons = {
            activated = "󰥔";
            deactivated = "";
          };
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
          persistent-workspaces = {"*" = 3;};
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

        "clock" = {
          interval = 1;
          format = "{:%a %d %H:%M:%S}";
          rotate = 0;
          format-alt = "{:%R %d·%m·%y}";
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
        "hyprland/window" = {
          max-length = 70;
          format = "{}";
          icon = true;
          icon-size = 18;
          separate-outputs = true;
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

        "battery" = {
          states = {
            good = 95;
            warning = 30;
            critical = 20;
          };
          format = "{icon} {capacity}%";
          rotate = 0;
          format-charging = " {capacity}%";
          format-plugged = " {capacity}%";
          format-alt = "{time} {icon}";
          format-icons = ["󰂎" "󰁺" "󰁻" "󰁼" "󰁽" "󰁾" "󰁿" "󰂀" "󰂁"];
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

      bottomBar = {
        layer = "top";
        position = "bottom";
        margin-bottom = 10;
        #width      = 43;
        #height       = 1000;
        height = 43;
        width = 1900;
        exclusive = true;
        passthrough = false;
        gtk-layer-shell = true;
        reload_style_on_change = true;
        output = ["eDP-1"];
        modules-left = [
          "custom/padd"
          "custom/l_end"
          "mpris"
          "custom/r_end"
          "custom/padd"
        ];
        modules-center = [
          "custom/padd"
          "custom/l_end"
          "custom/cava"
          "custom/r_end"
          "custom/padd"
        ];
        modules-right = [
          "custom/padd"
          "custom/l_end"
          "tray"
          "custom/r_end"
          "custom/l_end"
          "network"
          "custom/r_end"
          #"custom/l_end" "bluetooth" "custom/r_end"
          "custom/l_end"
          "cpu"
          "memory"
          "custom/r_end"
          "custom/padd"
        ];

        "custom/cava" = {
          exec = "${scriptsDir}/cava";
          format = "{}";
        };

        "mpris" = {
          interval = 1;
          max-length = 80;
        };

        "tray" = {
          icon-size = 18;
          rotate = 0;
          spacing = 5;
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

        "network" = {
          tooltip = true;
          format-alt = " ";
          rotate = 0;
          format-ethernet = "󰈀 ";
          tooltip-format = "Network: <big><b>{essid}</b></big>\nSignal: <b>{signalStrength}%</b>\nIP: <b>{ipaddr}/{cidr}</b>";
          format-linked = "󰈀 {ifname} (No IP)";
          format-disconnected = "󰖪 ";
          format-wifi = "<span foreground='#86afef'>  {essid}:  {bandwidthDownBytes}</span> <span foreground='#86afef'> {bandwidthUpBytes}</span>";
          interval = 2;
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
        "custom/sl_end" = {
          format = " ";
          interval = "once";
          tooltip = false;
        };
        "custom/sr_end" = {
          format = " ";
          interval = "once";
          tooltip = false;
        };
        "custom/rl_end" = {
          format = " ";
          interval = "once";
          tooltip = false;
        };
        "custom/rr_end" = {
          format = " ";
          interval = "once";
          tooltip = false;
        };
        "custom/padd" = {
          format = " ";
          interval = "once";
          tooltip = false;
        };
      }; #sideBar
    }; #settings
  }; #programs.waybar
}
