{
  config,
  lib,
  pkgs,
  inputs,
  ...
}: let
  scriptsDir = builtins.toString ./scripts;
  rofiScriptsDir = builtins.toString ../shared/config/rofi/scripts;
in {
  home.packages = with pkgs; [
    pavucontrol
    libnotify
    yad
    wlroots
    bc
    jq
    glib
    brightnessctl
  ];
  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk
      xdg-desktop-portal-hyprland
    ];
  };
  home.sessionVariables = {
    XDG_CONFIG_HOME = "$HOME/.config";
    NIXOS_OZONE_WL = "1";
  };
  services.cliphist.enable = true;
  services.blueman-applet.enable = true;
  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
    plugins = with pkgs; [
      hyprlandPlugins.hyprspace
      #hyprlandPlugins.hyprbars
    ];
    settings = {
      monitor = [
        "eDP-1, highrr, 0x0, 1"
        "Unknown-1, disable"
        "HDMI-A, highrr, -1920x0, 1"
      ];
      exec-once = [
        "dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
        "swww-daemon"
        "waybar"
        "swaync"
        "wl-clipboard-history -t"
        "fcitx5"
        "wl-paste --type text --watch cliphist store"
        "wl-paste --type image --watch cliphist store"
        "hyprctl plugin load /nix/store/hjn4qyc431qv5j81bs7lmrrc4qllppry-hyprspace-0-unstable-2025-05-09/lib/libhyprspace.so"
      ];

      env = [
        "XCURSOR_THEME,Bibata-Modern-Ice"
        "XCURSOR_SIZE,24"
        "CLUTTER_BACKEND,wayland"
        "GDK_BACKEND,wayland,x11"
        "QT_AUTO_SCREEN_SCALE_FACTOR,1"
        "QT_QPA_PLATFORM,wayland;xcb"
        "QT_QPA_PLATFORMTHEME,qt6ct"
        "QT_SCALE_FACTOR,1"
        "QT_WAYLAND_DISABLE_WINDOWDECORATION,1"
        "XDG_CURRENT_DESKTOP,Hyprland"
        "XDG_SESSION_DESKTOP,Hyprland"
        "XDG_SESSION_TYPE,wayland"
        "MOZ_ENABLE_WAYLAND,1"
        "MOZ_DISABLE_RDD_SANDBOX,1"
        "EGL_PLATFORM,wayland"

        #"LIBVA_DRIVER_NAME,nvidia"
        #"XDG_SESSION_TYPE,wayland"
        #"GBM_BACKEND,nvidia-drm"
        #" __GLX_VENDOR_LIBRARY_NAME,nvidia"
      ];

      decoration = {
        inactive_opacity = 0.85;
        active_opacity = 1.0;
        rounding = 20;
        blur = {
          size = 5;
          passes = 3;
          new_optimizations = "yes";
          contrast = 1;
          brightness = 1;
        };
        shadow = {
          enabled = true;
          range = 10;
          render_power = 2;
          color = "rgba(0, 0, 0, 0.25)";
        };
      };

      input = {
        kb_layout = "us";
        numlock_by_default = true;
        follow_mouse = 1;
        sensitivity = 0.4;
        touchpad = {
          natural_scroll = true;
          tap-to-click = true;
          disable_while_typing = true;
        };
      };

      general = {
        gaps_in = 5;
        gaps_out = 20;
        border_size = 4;
        "col.active_border" = "0xFF86AFEF";
        "col.inactive_border" = "0xFF1B1E25";
        layout = "dwindle";
      };

      bezier = [
        #"in-out, .65, -0.01, 0, .95"
        #"woa, 0, 0, 0, 1"
        "myBezier, 0.4, 0.0, 0.2, 1.0"
      ];

      animation = [
        "windows, 1, 2.5, myBezier, popin 80%"
        "border, 1, 2.5, myBezier"
        "fade, 1, 2.5, myBezier"
        "workspaces, 1, 2.5, myBezier, slidefade 20%"
        #"windows, 1, 2, woa, popin"
        #"border, 1, 10, default"
        #"fade, 1, 10, default"
        #"workspaces, 1, 5, in-out, slide"
      ];

      dwindle = {
        pseudotile = true;
        preserve_split = true;
      };

      cursor = {
        no_hardware_cursors = false;
      };

      gestures = {
        workspace_swipe = "on";
      };

      misc = {
        disable_hyprland_logo = true;
      };

      debug = {
        disable_logs = false;
      };

      bindm = [
        "SUPER, mouse:272, movewindow"
        "SUPER, mouse:273, resizewindow"
      ];

      "$terminal" = "kitty";
      "$shell" = "fish";

      bind = [
        "SUPER, Return, exec, $terminal"
        #volume
        #",XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 2%-"
        #",XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 2%+"
        ",XF86AudioLowerVolume, exec, ${scriptsDir}/volume down"
        ",XF86AudioRaiseVolume, exec, ${scriptsDir}/volume up"
        ",XF86AudioMute, exec, ${scriptsDir}/volume mute"
        ",F1, exec, ${scriptsDir}/volume mute"
        #bright
        ",XF86MonBrightnessDown,exec, ${scriptsDir}/bright down"
        ",XF86MonBrightnessUp,exec, ${scriptsDir}/bright up"
        #
        "SUPER, Space, exec, pkill rofi || rofi -show drun"
        "SUPER, N, exec, swaync-client -t -sw"
        #
        "SUPER, A, exec, hyprctl dispatch overview:toggle"
        "SUPER, Q, killactive,"
        "SUPER SHIFT, Q, exec, ${scriptsDir}/killin"
        "SUPER, T, exec, $terminal -e $shell -c ranger"
        "bind = SUPER, F, fullscreen"
        "SUPER, L, exec, ${rofiScriptsDir}/powermenu"
        "bind = SUPER, R, exec, pkill waybar || waybar & disown"
        "SUPER, W, togglefloating"
        "bind = SUPER SHIFT, W, exec, ${rofiScriptsDir}/wallselect-hypr"
        "SUPER, M, exec, ${rofiScriptsDir}/mpd"
        "SUPER SHIFT, S, exec, ${scriptsDir}/scrshot --swappy"
        "SUPER ALT, S, exec, ${scriptsDir}/scrshot --now"
        "SUPER, H, exec, ${scriptsDir}/hints"
        "SUPER, V, exec, ${rofiScriptsDir}/clip"
        ",XF86Launch3, exec, rog-control-center"
        "SUPER, Period, exec, ${rofiScriptsDir}/emoji"
        "SUPER, P, exec, $terminal -e htop"
        #Hidden workspace
        "SUPER ALT, S, movetoworkspacesilent, special"
        "SUPER, S, togglespecialworkspace,"
        #Focus
        "SUPER, left, movefocus, l"
        "SUPER, right, movefocus, r"
        "SUPER, up, movefocus, u"
        "SUPER, down, movefocus, d"
        # Switch workspaces
        "SUPER, 1, workspace, 1"
        "SUPER, 2, workspace, 2"
        "SUPER, 3, workspace, 3"
        "SUPER, 4, workspace, 4"
        "SUPER, 5, workspace, 5"
        "SUPER, 6, workspace, 6"
        "SUPER, 7, workspace, 7"
        "SUPER, 8, workspace, 8"
        "SUPER, 9, workspace, 9"
        "SUPER, 0, workspace, 10"
        # Move active window to a workspace
        "SUPER SHIFT, 1, movetoworkspacesilent, 1"
        "SUPER SHIFT, 2, movetoworkspacesilent, 2"
        "SUPER SHIFT, 3, movetoworkspacesilent, 3"
        "SUPER SHIFT, 4, movetoworkspacesilent, 4"
        "SUPER SHIFT, 5, movetoworkspacesilent, 5"
        "SUPER SHIFT, 6, movetoworkspacesilent, 6"
        "SUPER SHIFT, 7, movetoworkspacesilent, 7"
        "SUPER SHIFT, 8, movetoworkspacesilent, 8"
        "SUPER SHIFT, 9, movetoworkspacesilent, 9"
        "SUPER SHIFT, 0, movetoworkspacesilent, 10"
        # Move/resize windows
        "SUPER SHIFT, right, resizeactive, 50 0"
        "SUPER SHIFT, left, resizeactive, -50 0"
        "SUPER SHIFT, up, resizeactive, 0 -50"
        "SUPER SHIFT, down, resizeactive, 0 50"
        "SUPER CTRL, up, movewindow, u"
        "SUPER CTRL, down, movewindow, d"
        "SUPER CTRL, left, movewindow, l"
        "SUPER CTRL, right, movewindow, r"
      ];

      windowrulev2 = [
        "opacity 1 1,floating:1"
        "float,class:^(Rofi|rofi)$"
        "float,class:^(Blueman-manager|blueman-manager)$"
        "size 800 500,class:^(Blueman-manager|blueman-manager)$"
        "float,class:^(imv)$"
        "float,class:^(Yad|yad)$"
        "size 800 915,class:^(Yad|yad)$"
        "float,class:^(pavucontrol|org.pulseaudio.pavucontrol|com.saivert.pwvucontrol)$"
        #"opacity 0.85 0.7, class:^(Alacritty)$ # Alacritty"
        "opacity 0.0 override, class:^(xwaylandvideobridge)$"
        "noanim, class:^(xwaylandvideobridge)$"
        "noinitialfocus, class:^(xwaylandvideobridge)$"
        "maxsize 1 1, class:^(xwaylandvideobridge)$"
        "noblur, class:^(xwaylandvideobridge)$"
      ];
    };
  };
}
