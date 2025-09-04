{
  config,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [ueberzugpp atool zip unzip p7zip unrar];
  services = {
    udiskie.enable = true;
    udiskie.tray = "auto";
  };
  programs.ranger = {
    enable = true;
    settings = {
      preview_images_method = "kitty";
      draw_borders = true;
    };
    mappings = {
      d = "shell mv %s ~/.local/share/Trash/files/";
      gc = "cd ~/.config";
      gt = "cd ~/.local/share/Trash/files";
      r = "rename_append";
      a = "console shell ~/.config/ranger/new.sh%space";
      DD = "delete";
      x = "cut";
      e = "shell atool -x %f";
      c = "console compress%space";
    };
  };
  home.file.".config/ranger/new.sh".source = ./config/ranger/new.sh;
  home.file.".config/ranger/rifle.conf".source = ./config/ranger/rifle.conf;
  home.file.".config/ranger/commands.py".text = ''
    import os
    from ranger.api.commands import Command
    from ranger.core.loader import CommandLoader

    class compress(Command):
        def execute(self):
            """ Compress marked files to current directory """
            cwd = self.fm.thisdir
            marked_files = cwd.get_selection()

            if not marked_files:
                return

            def refresh(_):
                cwd = self.fm.get_directory(original_path)
                cwd.load_content()

            original_path = cwd.path
            parts = self.line.split()
            au_flags = parts[1:]

            descr = "compressing files in: " + os.path.basename(parts[1])
            obj = CommandLoader(args=['apack'] + au_flags + \
                [os.path.relpath(f.path, cwd.path) for f in marked_files], descr=descr, read=True)

            obj.signal_bind('after', refresh)
            self.fm.loader.add(obj)

        def tab(self, tabnum):
            """ Complete with current folder name """
            extension = ['.zip', '.tar.gz', '.rar', '.7z']
            return ['compress ' + os.path.basename(self.fm.thisdir.path) + ext for ext in extension]
  '';
}
