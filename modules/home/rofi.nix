# modules/rofi.nix
{ config, lib, pkgs, ... }:

{
  programs.rofi = {
    enable    = true;
    package   = pkgs.rofi;
    font      = "JetBrains Mono Nerd Font 10";
    location  = "center";
    xoffset   = 0;
    yoffset   = 0;
    cycle     = true;
    terminal  = "alacritty";
    configPath = "~/.config/rofi/auto-config.rasi";
    theme     = "~/.config/rofi/themes/menu.rasi";
    # no extraConfig or home.file for config.rasi, we’ll inline it below
  };

  home.file = lib.mkMerge
    [
      # main config.rasi
      {
        ".config/rofi/config.rasi".text = ''
    @theme "~/.config/rofi/themes/menu.rasi"

    configuration {
      hover-select:    true;
      me-select-entry: "";
      me-accept-entry: [ MousePrimary, MouseSecondary, MouseDPrimary ];
    }
  '';
      }

      # themes/menu.rasi, fully inlined
      {
        ".config/rofi/themes/menu.rasi".text = ''
          configuration {
            modi:            "drun,window";
            show-icons:      true;
            display-drun:    " ";
            display-window:  " ";
            drun-display-format: "{name}";
            window-format:   "{w} · {c} · {t}";
          }

          * {
            font:       "JetBrains Mono Nerd Font 10";
            background: #1b1e25;
            foreground: #edeeff;
            selected:   #86afef;
            active:     #6db2f7;
            urgent:     #86afef;
          }

          window {
            transparency:    "real";
            location:       center;
            anchor:         center;
            fullscreen:     false;
            width:          800px;
            height:         500px;
            x-offset:       0px;
            y-offset:       0px;
            enabled:        true;
            border-radius:  20px;
            cursor:         "default";
            background-color: @background;
          }

          mainbox {
            enabled:     true;
            spacing:     0px;
            background-color: transparent;
            orientation: vertical;
            children:    [ "inputbar", "listbox" ];
          }

          listbox {
            spacing:     20px;
            padding:     20px;
            background-color: transparent;
            orientation: vertical;
            children:    [ "message", "listview" ];
          }

          inputbar {
            enabled:     true;
            spacing:     10px;
            padding:     80px 60px;
            background-color: transparent;
            background-image: url("/home/nixuris/hyprnix/pics/meconnopsis.jpg",width);
            text-color:  @foreground;
            orientation: horizontal;
            children:    [ "textbox-prompt-colon", "entry", "dummy" ];
          }

          textbox-prompt-colon {
            enabled:        true;
            expand:         false;
            str:            " ";
            padding:        12px 15px;
            border-radius:  100%;
            background-color: @background;
            text-color:     inherit;
          }

          entry {
            enabled:        true;
            expand:         false;
            width:          200px;
            padding:        12px 16px;
            border-radius:  100%;
            background-color: @background;
            text-color:     inherit;
            cursor:         text;
            placeholder:    "     Search Apps";
            placeholder-color: inherit;
          }

          dummy {
            expand:          true;
            background-color: transparent;
          }

          mode-switcher {
            enabled:          true;
            spacing:          10px;
            background-color: transparent;
            text-color:       @foreground;
          }

          button {
            width:            42px;
            padding:          12px;
            border-radius:    100%;
            background-color: @background;
            text-color:       inherit;
            cursor:           pointer;
          }

          button selected {
            background-color: @selected;
            text-color:       @background;
          }

          listview {
            enabled:          true;
            columns:          4;
            lines:            7;
            cycle:            true;
            dynamic:          true;
            scrollbar:        false;
            layout:           vertical;
            reverse:          false;
            fixed-height:     true;
            fixed-columns:    true;
            spacing:          10px;
            background-color: transparent;
            text-color:       @foreground;
            cursor:           "default";
          }

          element {
            enabled:        true;
            spacing:        10px;
            padding:        4px;
            border-radius:  6;
            background-color: transparent;
            text-color:     @foreground;
            cursor:         pointer;
          }

          element normal.normal {
            background-color: inherit;
            text-color:     inherit;
          }
          element normal.urgent {
            background-color: @urgent;
            text-color:     @foreground;
          }
          element normal.active {
            background-color: @active;
            text-color:     @foreground;
          }
          element selected.normal {
            background-color: @selected;
            text-color:       @background;
          }
          element selected.urgent {
            background-color: @urgent;
            text-color:       @background;
          }
          element selected.active {
            background-color: @urgent;
            text-color:       @background;
          }

          element-icon {
            background-color: transparent;
            text-color:       inherit;
            size:             32px;
            cursor:           inherit;
          }

          element-text {
            background-color: transparent;
            text-color:       inherit;
            cursor:           inherit;
            vertical-align:   0.5;
            horizontal-align: 0.0;
          }

          message {
            background-color: transparent;
          }

          textbox {
            padding:         12px;
            border-radius:   100%;
            background-color: @background;
            text-color:      @foreground;
            vertical-align:  0.5;
            horizontal-align: 0.0;
          }

          error-message {
            padding:         12px;
            border-radius:   20px;
            background-color: @background;
            text-color:      @foreground;
          }
        '';
      }

      # clip.rasi
      {
        ".config/rofi/clip.rasi".text = ''
          @import "~/.config/rofi/config.rasi"
          entry {
            width: 30%;
            placeholder: "                          Search Messages";
          }
          listview {
            columns: 2;
            lines: 8;
          }
        '';
      }

      # config-emoji.rasi
      {
        ".config/rofi/config-emoji.rasi".text = ''
          @import "~/.config/rofi/config.rasi"
          entry {
            width: 30%;
            placeholder: "                        💫 Search Emojis";
          }
          listview {
            columns: 1;
            lines: 8;
          }
        '';
      }

      # session.rasi
      {
        ".config/rofi/session.rasi".text = ''
          @import "~/.config/rofi/config.rasi"
          entry { enabled: false; }
          inputbar {
            spacing: 10px;
            padding: 130px 60px;
            background-color: transparent;
          }
          textbox-prompt-colon { enabled: false; }
          listview { columns: 1; lines: 8; }
        '';
      }

      # wallselect.rasi
      {
        ".config/rofi/wallselect.rasi".text = ''
          @import "~/.config/rofi/config.rasi"
          configuration {
            modi:                        "drun";
            show-icons:                  true;
            drun-display-format:         "{name}";
            hover-select:                true;
            me-select-entry:             "";
            me-accept-entry:             [ MousePrimary, MouseSecondary, MouseDPrimary ];
          }
          * {
            font:       "JetBrains Mono Nerd Font 10";
            background: #1b1e25;
            foreground: #edeeff;
            selected:   #86afef;
            active:     #6db2f7;
            urgent:     #fb507c;
          }
          window { enabled: true; fullscreen: false; width: 2000px; transparency: "real"; cursor: "default"; spacing: 0px; padding: 0px; border: 0px; border-radius: 0px; background-color: transparent; }
          mainbox { enabled: true; children: [ "listview" ]; background-color: @background; }
          listview { enabled: true; columns: 6; lines: 1; spacing: 50px; padding: 20px 150px; cycle: true; dynamic: false; scrollbar: false; layout: vertical; reverse: false; fixed-height: true; fixed-columns: true; cursor: "default"; background-color: transparent; text-color: @foreground; }
          element { enabled: true; orientation: horizontal; spacing: 0px; padding: 0px; border-radius: 20px; cursor: pointer; background-color: transparent; text-color: @foreground; }
          @media(max-aspect-ratio: 1.8) { element { orientation: vertical; } }
          element selected.normal { background-color: @selected; text-color: @background; }
          element-icon { size: 33%; cursor: inherit; border-radius: 0px; background-color: transparent; text-color: inherit; }
          element-text { vertical-align: 0.5; horizontal-align: 0.5; padding: 20px; cursor: inherit; background-color: transparent; text-color: inherit; }
        '';
      }
    ];
}

