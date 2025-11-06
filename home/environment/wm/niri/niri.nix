{
  pkgs,
  inputs,
  ...
}:
let
  scriptsDir = builtins.toString ../../shared/scripts/sys;
  rofiScriptsDir = builtins.toString ../../shared/scripts/rofi;
in
{
  imports = [ inputs.niri.homeModules.niri ];
  nixpkgs.overlays = [ inputs.niri.overlays.niri ];
  home.packages = with pkgs; [
    xwayland-satellite
    pavucontrol
    libnotify
    glib
    brightnessctl
  ];
  services.cliphist.enable = true;
  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk
      xdg-desktop-portal-gnome
    ];
    config = {
      common = {
        default = [ "gtk" ];
      };
      niri = {
        default = [
          "gtk"
          "gnome"
        ];
        "org.freedesktop.impl.portal.ScreenCast" = [ "gnome" ];
        "org.freedesktop.impl.portal.Screenshot" = [ "gnome" ];
      };
    };
  };
  programs.niri = {
    enable = true;
    package = pkgs.niri;
    config = ''
          screenshot-path "~/Pictures/Screenshots/Screenshot from %Y-%m-%d %H-%M-%S.png"
          cursor {
              xcursor-theme "Bibata-Modern-Ice"
              xcursor-size 24
          }
          hotkey-overlay {
              skip-at-startup
          }
          overview {
              workspace-shadow {
                  off
              }
          }
          input {
              keyboard {
                  xkb {
                  }
                  numlock
              }

              touchpad {
                  tap
                  dwt
                  // dwtp
                  // drag false
                  // drag-lock
                  natural-scroll
                  accel-speed 0.2
                  // accel-profile "flat"
                  // scroll-method "two-finger"
                  // disabled-on-external-mouse
              }
              mouse {}
              focus-follows-mouse max-scroll-amount="0%"
          }

          animations {}
          layer-rule {
              match namespace="waybar"
              match at-startup=true
              opacity 0.99999
              //block-out-from "screencast"
              geometry-corner-radius 12
              place-within-backdrop true
          }
          layer-rule {
              match namespace="swww-daemon"
              place-within-backdrop true
          }
          layer-rule {
              match namespace="^notifications$"

              block-out-from "screencast"
          }
          output "eDP-1" {
              //variable-refresh-rate on-demand=true
              variable-refresh-rate
              mode "1920x1080@143.998"
              scale 1

              // Transform allows to rotate the output counter-clockwise, valid values are:
              // normal, 90, 180, 270, flipped, flipped-90, flipped-180 and flipped-270.
              transform "normal"
              position x=1280 y=0
          }
          layout {
              gaps 16
              background-color "transparent"
              center-focused-column "never"
              preset-column-widths {
                  proportion 0.33333
                  proportion 0.5
                  proportion 0.66667
              }

              default-column-width { proportion 0.5; }

              focus-ring {
                  width 4
                  active-color "#86afef"
                  inactive-color "#505050"
              }
              border {
                  off
                  width 4
                  active-color "#ffc87f"
                  inactive-color "#505050"
                  urgent-color "#9b0000"
          }
              struts {}
          }
          //prefer-no-csd

      window-rule {
          match app-id=r#"firefox$"# title="^Picture-in-Picture$"
          open-floating true
      }

      window-rule {
          match app-id=r#"imv$"#
          open-floating true
      }
      window-rule {
          geometry-corner-radius 10
          clip-to-geometry true
      }
      window-rule {
         shadow {
                  off
                  draw-behind-window true
                  softness 30
                  spread 10
                  offset x=0 y=5
                  color "#0007"
              }
          }

          binds {
              Mod+Shift+Slash { show-hotkey-overlay; }
              XF86AudioRaiseVolume allow-when-locked=true { spawn "${scriptsDir}/volume" "up"; }
              XF86AudioLowerVolume allow-when-locked=true { spawn "${scriptsDir}/volume" "down"; }
              XF86AudioMute        allow-when-locked=true { spawn "${scriptsDir}/volume" "mute"; }
              XF86AudioMicMute     allow-when-locked=true { spawn "wpctl" "set-mute" "@DEFAULT_AUDIO_SOURCE@" "toggle"; }
              XF86MonBrightnessDown allow-when-locked=true {spawn "${scriptsDir}/bright" "down" ;}
              XF86MonBrightnessUp allow-when-locked=true {spawn "${scriptsDir}/bright" "up" ;}

              Mod+Q { close-window; }

              Mod+Return hotkey-overlay-title="Open a Terminal: kitty" { spawn "uwsm" "app" "--" "kitty"; }
              Mod+Space hotkey-overlay-title="Run an Application: rofi" { spawn "uwsm" "app" "--" "rofi" "-show" "drun"; }
              Mod+N hotkey-overlay-title="Notification Restore: Mako" { spawn "makoctl" "restore"; }
              Mod+L hotkey-overlay-title="Session Handler" { spawn "${rofiScriptsDir}/powermenu"; }
              Mod+V hotkey-overlay-title="Clipboard Manager" { spawn "${rofiScriptsDir}/clip"; }
              Mod+Period hotkey-overlay-title="Emoji Selector" { spawn "${rofiScriptsDir}/emoji"; }
              Mod+Shift+W hotkey-overlay-title="Wallpaper Manager" { spawn "${rofiScriptsDir}/wallselect-niri"; }
              Mod+P hotkey-overlay-title="Wallpaper Manager" { spawn "${rofiScriptsDir}/power"; }

              Mod+M hotkey-overlay-title="MPD Control" { spawn "${rofiScriptsDir}/mpd-rofi"; }

              Mod+A repeat=false { toggle-overview; }

              Mod+Left  { focus-column-left; }
              Alt+Down  { focus-window-down; }
              Alt+Up    { focus-window-up; }
              Mod+Right { focus-column-right; }

              Mod+Ctrl+Left  { move-column-left; }
              Mod+Ctrl+Down  { move-window-down; }
              Mod+Ctrl+Up    { move-window-up; }
              Mod+Ctrl+Right { move-column-right; }

              Mod+Down              { focus-workspace-down; }
              Mod+Up              { focus-workspace-up; }
              Alt+Ctrl+Down         { move-column-to-workspace-down; }
              Alt+Ctrl+Up         { move-column-to-workspace-up; }

              Mod+Shift+Page_Down { move-workspace-down; }
              Mod+Shift+Page_Up   { move-workspace-up; }
              Mod+Shift+U         { move-workspace-down; }
              Mod+Shift+I         { move-workspace-up; }

              Mod+WheelScrollDown      cooldown-ms=150 { focus-workspace-down; }
              Mod+WheelScrollUp        cooldown-ms=150 { focus-workspace-up; }
              Mod+Ctrl+WheelScrollDown cooldown-ms=150 { move-column-to-workspace-down; }
              Mod+Ctrl+WheelScrollUp   cooldown-ms=150 { move-column-to-workspace-up; }

              Mod+WheelScrollRight      { focus-column-right; }
              Mod+WheelScrollLeft       { focus-column-left; }
              Mod+Ctrl+WheelScrollRight { move-column-right; }
              Mod+Ctrl+WheelScrollLeft  { move-column-left; }

              Mod+Shift+WheelScrollDown      { focus-column-right; }
              Mod+Shift+WheelScrollUp        { focus-column-left; }
              Mod+Ctrl+Shift+WheelScrollDown { move-column-right; }
              Mod+Ctrl+Shift+WheelScrollUp   { move-column-left; }

              Mod+1 { focus-workspace 1; }
              Mod+2 { focus-workspace 2; }
              Mod+3 { focus-workspace 3; }
              Mod+4 { focus-workspace 4; }
              Mod+5 { focus-workspace 5; }
              Mod+6 { focus-workspace 6; }
              Mod+7 { focus-workspace 7; }
              Mod+8 { focus-workspace 8; }
              Mod+9 { focus-workspace 9; }
              Mod+Shift+1 { move-column-to-workspace 1; }
              Mod+Shift+2 { move-column-to-workspace 2; }
              Mod+Shift+3 { move-column-to-workspace 3; }
              Mod+Shift+4 { move-column-to-workspace 4; }
              Mod+Shift+5 { move-column-to-workspace 5; }
              Mod+Shift+6 { move-column-to-workspace 6; }
              Mod+Shift+7 { move-column-to-workspace 7; }
              Mod+Shift+8 { move-column-to-workspace 8; }
              Mod+Shift+9 { move-column-to-workspace 9; }

              Mod+Alt+Left  { consume-or-expel-window-left; }
              Mod+Alt+Right { consume-or-expel-window-right; }
              Mod+F { maximize-column; }
              Mod+Shift+F { fullscreen-window; }

              Mod+Shift+Left { set-column-width "-10%"; }
              Mod+Shift+Right { set-column-width "+10%"; }

              Mod+Shift+Up { set-window-height "-10%"; }
              Mod+Shift+Down { set-window-height "+10%"; }

              Mod+W       { toggle-window-floating; }
              Mod+Shift+S { screenshot; }
              Mod+Alt+S { screenshot-screen; }
              Alt+Print { screenshot-window; }
              Mod+Escape allow-inhibiting=false { toggle-keyboard-shortcuts-inhibit; }
          }
    '';
  };
}
