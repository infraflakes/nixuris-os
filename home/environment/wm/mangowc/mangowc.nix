{
  config,
  inputs,
  lib,
  pkgs,
  ...
}:
let
  scriptsDir = builtins.toString ../../shared/scripts/sys;
  rofiScriptsDir = builtins.toString ../../shared/scripts/rofi;
in
{
  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-wlr # screencast / screenshot
      xdg-desktop-portal-gtk # file-chooser, settings, etc.
    ];
    # tell the portal which backend to use for which interface
    config = {
      # fallback / catch-all
      common = {
        default = [
          "gtk"
          "wlr"
        ];
        "org.freedesktop.impl.portal.ScreenCast" = [
          "gtk"
          "wlr"
        ];
        "org.freedesktop.impl.portal.Screenshot" = [
          "gtk"
          "wlr"
        ];
        "org.freedesktop.impl.portal.FileChooser" = [ "gtk" ];
      };
    };
  };
  home.packages = with pkgs; [
    pavucontrol
    libnotify
    glib
    brightnessctl
  ];
  services.cliphist.enable = true;
  wayland.windowManager.mango = {
    enable = true;
    settings = ''
      adaptive_sync=1
      disable_while_typing=1
      trackpad_natural_scrolling=1

      cursor_size=24
      cursor_theme=Bibata-Modern-Ice
      gappih=30
      gappiv=30
      gappoh=30
      gappov=30

       █████╗ ███╗   ██╗██╗███╗   ███╗ █████╗ ████████╗██╗ ██████╗ ███╗   ██╗███████╗
      ██╔══██╗████╗  ██║██║████╗ ████║██╔══██╗╚══██╔══╝██║██╔═══██╗████╗  ██║██╔════╝
      ███████║██╔██╗ ██║██║██╔████╔██║███████║   ██║   ██║██║   ██║██╔██╗ ██║███████╗
      ██╔══██║██║╚██╗██║██║██║╚██╔╝██║██╔══██║   ██║   ██║██║   ██║██║╚██╗██║╚════██║
      ██║  ██║██║ ╚████║██║██║ ╚═╝ ██║██║  ██║   ██║   ██║╚██████╔╝██║ ╚████║███████║
      ╚═╝  ╚═╝╚═╝  ╚═══╝╚═╝╚═╝     ╚═╝╚═╝  ╚═╝   ╚═╝   ╚═╝ ╚═════╝ ╚═╝  ╚═══╝╚══════╝
      tag_animation_direction=0
      animations=1
      layer_animations=1
      animation_type_open=slide
      animation_type_close=slide
      animation_fade_in=1
      animation_fade_out=1
      zoom_initial_ratio=0.3
      zoom_end_ratio=0.8
      fadein_begin_opacity=0.5
      fadeout_begin_opacity=0.8
      animation_duration_move=400
      animation_duration_open=200
      animation_duration_tag=300
      animation_duration_close=150
      animation_duration_focus=0
      animation_curve_open=0.46,1.0,0.29,1
      animation_curve_move=0.46,1.0,0.29,1
      animation_curve_tag=0.46,1.0,0.29,1
      animation_curve_close=0.08,0.92,0,1
      animation_curve_focus=0.46,1.0,0.29,1

      # layer rule
      layerrule=animation_type_open:zoom,layer_name:rofi
      layerrule=animation_type_close:zoom,layer_name:rofi


      ██╗  ██╗███████╗██╗   ██╗██████╗ ██╗███╗   ██╗██████╗ ███████╗
      ██║ ██╔╝██╔════╝╚██╗ ██╔╝██╔══██╗██║████╗  ██║██╔══██╗██╔════╝
      █████╔╝ █████╗   ╚████╔╝ ██████╔╝██║██╔██╗ ██║██║  ██║███████╗
      ██╔═██╗ ██╔══╝    ╚██╔╝  ██╔══██╗██║██║╚██╗██║██║  ██║╚════██║
      ██║  ██╗███████╗   ██║   ██████╔╝██║██║ ╚████║██████╔╝███████║
      ╚═╝  ╚═╝╚══════╝   ╚═╝   ╚═════╝ ╚═╝╚═╝  ╚═══╝╚═════╝ ╚══════╝
      bind=SUPER,Return,spawn,uwsm app -- kitty
      bind=SUPER,space,spawn,uwsm app -- rofi -show drun
      bind=SUPER,q,killclient,
      bind=SUPER,r,reload_config
      bind=NONE,XF86AudioLowerVolume, spawn, ${scriptsDir}/volume down
      bind=NONE,XF86AudioRaiseVolume, spawn, ${scriptsDir}/volume up
      bind=NONE,XF86AudioMute, spawn, ${scriptsDir}/volume mute
      bind=NONE,XF86MonBrightnessDown,spawn, ${scriptsDir}/bright down
      bind=NONE,XF86MonBrightnessUp,spawn, ${scriptsDir}/bright up
      bind=NONE,F1, spawn, ${scriptsDir}/volume mute
      bind=SUPER+SHIFT, s, spawn, ${scriptsDir}/scrshot --swappy
      bind=SUPER+ALT, s, spawn, ${scriptsDir}/scrshot --now
      bind=SUPER, n, spawn, makoctl restore
      bind=SUPER, l, spawn, ${rofiScriptsDir}/powermenu
      bind=SUPER, p, spawn, ${rofiScriptsDir}/power
      bind=SUPER+SHIFT, r, spawn, sh -c 'pkill waybar || uwsm app -- waybar'
      bind=SUPER, m, spawn, ${rofiScriptsDir}/mpd-rofi
      bind=SUPER, v, spawn, ${rofiScriptsDir}/clip
      bind=SUPER, period, spawn, ${rofiScriptsDir}/emoji
      bind=SUPER+SHIFT,p,toggleglobal,
      bind=SUPER,a,toggleoverview,
      bind=SUPER,w,togglefloating,
      bind=SUPER,f,togglefullscreen,
      bind=SUPER,Left,focusdir,left
      bind=SUPER,Right,focusdir,right

      # swap window
      bind=SUPER+CTRL,Up,exchange_client,up
      bind=SUPER+CTRL,Down,exchange_client,down
      bind=SUPER+CTRL,Left,exchange_client,left
      bind=SUPER+CTRL,Right,exchange_client,right

      # resizewin
      bind=SUPER+SHIFT,Up,resizewin,+0,-50
      bind=SUPER+SHIFT,Down,resizewin,+0,+50
      bind=SUPER+SHIFT,Left,resizewin,-50,+0
      bind=SUPER+SHIFT,Right,resizewin,+50,+0

      bind=SUPER,Up,viewtoleft,0
      bind=SUPER,Down,viewtoright,0
      bind=CTRL+SUPER,Up,tagtoleft,0
      bind=CTRL+SUPER,Down,tagtoright,0

      mousebind=SUPER,btn_left,moveresize,curmove
      mousebind=SUPER,btn_right,moveresize,curresize
      gesturebind=none,Down,3,viewtoleft,0
      gesturebind=none,Up,3,viewtoright,0
      gesturebind=none,Right,3,focusdir,left
      gesturebind=none,Left,3,focusdir,right
    '';
    autostart_sh = ''
      dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP
      systemctl --user set-environment XDG_CURRENT_DESKTOP=wlroots
    '';
  };
}
