{
  config,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    ffmpeg
    rmpc
    mpc
    mpd
    mpv
    ani-cli
    kew
    easytag
    nicotine-plus
    imv
  ];
  home.file.".config/rmpc".source = ../confs/config/rmpc;
  home.file.".config/mpd/mpd.conf".text = ''
    music_directory "~/Music"
    playlist_directory "~/Music"
    db_file "~/.config/mpd/database"
    log_file "~/.config/mpd/log"
    pid_file "~/.config/mpd/pid"
    state_file "~/.config/mpd/state"
    audio_output {
        type "pipewire"
        name "Pipewire Playback"
    }
    auto_update "yes"
    bind_to_address "127.0.0.1"
    port "6600"
    restore_paused "yes"
  '';
}
