{
  config,
  pkgs,
  ...
}:
{
  #Rofi
  home.file.".local/share/applications/rofi.desktop".text = ''
    [Desktop Entry]
    Name=DO NOT USE
    Exec=echo "nah"
    Terminal=false
    Type=Application
    NoDisplay=true
    Hidden=true
  '';

  home.file.".local/share/applications/rofi-theme-selector.desktop".text = ''
    [Desktop Entry]
    Name=NOPE
    Exec=echo "nope"
    Terminal=false
    Type=Application
    NoDisplay=true
    Hidden=true
  '';
  #Htop
  xdg.desktopEntries.htop = {
    name = "htop";
    exec = "htop";
    terminal = true;
    noDisplay = true;
  };
  #Bottom
  xdg.desktopEntries.bottom = {
    name = "bottom";
    exec = "btm";
    terminal = true;
    noDisplay = true;
  };
  #Yazi
  xdg.desktopEntries.yazi = {
    name = "Yazi";
    exec = "yazi";
    terminal = true;
    noDisplay = true;
  };
  #MPV
  xdg.desktopEntries.mpv = {
    name = "mpv";
    exec = "mpv";
    terminal = true;
    noDisplay = true;
  };
  #Fish
  xdg.desktopEntries.fish = {
    name = "fish";
    exec = "fish";
    terminal = true;
    noDisplay = true;
  };
  #Neovim
  xdg.desktopEntries."nvim" = {
    name = "Neovim wrapper";
    exec = "nvim %F";
    terminal = false;
    type = "Application";
    noDisplay = true;
  };
  #Fcitx and keyboard
  xdg.desktopEntries."org.fcitx.Fcitx5" = {
    name = "Fcitx5 Input Method";
    exec = "fcitx5";
    terminal = false;
    type = "Application";
    noDisplay = true;
  };
  xdg.desktopEntries."kcm_fcitx5" = {
    name = "Input Method";
    exec = "systemsettings kcm_fcitx5";
    terminal = false;
    type = "Application";
    noDisplay = true;
  };
  xdg.desktopEntries."kbd-layout-viewer5" = {
    name = "Keyboard layout viewer";
    exec = "kbd-layout-viewer5";
    terminal = false;
    type = "Application";
    noDisplay = true;
  };
  xdg.desktopEntries."org.fcitx.fcitx5-migrator" = {
    name = "Fcitx5 Migration Wizard";
    exec = "fcitx5-migrator";
    terminal = false;
    type = "Application";
    noDisplay = true;
  };
}
