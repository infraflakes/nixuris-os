{
  config,
  lib,
  pkgs,
  inputs,
  ...
}:
let
  scriptsDir = builtins.toString ../../execs/hypr;
  rofiScriptsDir = builtins.toString ../../execs/rofi;
in
{
  home.packages = with pkgs; [
    pavucontrol
    libnotify
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
      #hyprlandPlugins.hyprspace
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
        #"hyprctl plugin load /nix/store/hjn4qyc431qv5j81bs7lmrrc4qllppry-hyprspace-0-unstable-2025-05-09/lib/libhyprspace.so"
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

      # decoration = {
      #   inactive_opacity = 0.85;
      #   active_opacity = 1.0;
      #   rounding = 20;
      #   blur = {
      #     size = 5;
      #     passes = 3;
      #     new_optimizations = "yes";
      #     contrast = 1;
      #     brightness = 1;
      #   };
      #   shadow = {
      #     enabled = true;
      #     range = 10;
      #     render_power = 2;
      #     color = "rgba(0, 0, 0, 0.25)";
      #   };
      # };

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
        # gaps_in = 5;
        # gaps_out = 20;
        gaps_in = 0;
        gaps_out = 0;
        border_size = 3;
        "col.active_border" = "0xFF86AFEF";
        "col.inactive_border" = "0xFF1B1E25";
        layout = "dwindle";
      };

      bezier = [
        "myBezier, 0.4, 0.0, 0.2, 1.0"
      ];
      animations = {
        enabled = false;
      };

      animation = [
        "windows, 1, 2.5, myBezier, popin 80%"
        "border, 1, 2.5, myBezier"
        "fade, 1, 2.5, myBezier"
        "workspaces, 1, 2.5, myBezier, slidefade 20%"
      ];

      dwindle = {
        pseudotile = true;
        preserve_split = true;
      };

      cursor = {
        no_hardware_cursors = false;
      };

      gesture = [
        "3, horizontal, workspace"
      ];

      misc = {
        disable_hyprland_logo = true;
        vfr = true;
        vrr = 1;
      };

      debug = {
        disable_logs = false;
      };

      bindm = [
        "SUPER, mouse:272, movewindow"
        "SUPER, mouse:273, resizewindow"
      ];

      bind = [
        "SUPER, Return, exec, uwsm app -- kitty"
        ",XF86AudioLowerVolume, exec, ${scriptsDir}/volume down"
        ",XF86AudioRaiseVolume, exec, ${scriptsDir}/volume up"
        ",XF86AudioMute, exec, ${scriptsDir}/volume mute"
        ",F1, exec, ${scriptsDir}/volume mute"
        #bright
        ",XF86MonBrightnessDown,exec, ${scriptsDir}/bright down"
        ",XF86MonBrightnessUp,exec, ${scriptsDir}/bright up"
        #
        "SUPER, Space, exec, pkill rofi || rofi -show drun"
        "SUPER, N, exec, makoctl restore"
        #
        "SUPER, Q, killactive,"
        "SUPER SHIFT, Q, exec, ${scriptsDir}/killin"
        "SUPER, F, fullscreen"
        "SUPER, L, exec, ${rofiScriptsDir}/powermenu"
        "SUPER, R, exec, sh -c 'pkill waybar || uwsm app -- waybar'"
        "SUPER, W, togglefloating"
        "SUPER SHIFT, W, exec, ${rofiScriptsDir}/wallselect-hypr"
        "SUPER, M, exec, ${rofiScriptsDir}/mpd-rofi"
        "SUPER SHIFT, S, exec, ${scriptsDir}/scrshot --swappy"
        "SUPER ALT, S, exec, ${scriptsDir}/scrshot --now"
        "SUPER, V, exec, ${rofiScriptsDir}/clip"
        "SUPER, Period, exec, ${rofiScriptsDir}/emoji"
        #Hidden workspace
        "SUPER ALT, S, movetoworkspacesilent, special"
        "SUPER, S, togglespecialworkspace,"
        #Focus
        "SUPER, up, movefocus, l"
        "SUPER, down, movefocus, r"
        # Switch workspaces
        "SUPER, right, workspace, r+1"
        "SUPER, left, workspace, r-1"
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
        "SUPER CTRL, right, movetoworkspace, +1"
        "SUPER CTRL, left, movetoworkspace, -1"
        # Move/resize windows
        "SUPER SHIFT, right, resizeactive, 50 0"
        "SUPER SHIFT, left, resizeactive, -50 0"
        "SUPER SHIFT, up, resizeactive, 0 -50"
        "SUPER SHIFT, down, resizeactive, 0 50"
        "SUPER CTRL, left, movewindow, u"
        "SUPER CTRL, right, movewindow, d"
      ];

      windowrulev2 = [
        "opacity 1 1,floating:1"
        "float,class:^(Rofi|rofi)$"
        "float,class:^(Blueman-manager|blueman-manager)$"
        "size 800 500,class:^(Blueman-manager|blueman-manager)$"
        "float,class:^(imv)$"
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
