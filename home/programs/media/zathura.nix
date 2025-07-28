_: {
  programs.zathura = {
    enable = true;
    extraConfig = ''
      set font "Berkeley Mono 11"

      set default-bg "#282828"
      set default-fg "#ebdbb2"

      set statusbar-bg "#282828"
      set statusbar-fg "#ebdbb2"

      set inputbar-bg "#282828"
      set inputbar-fg "#ebdbb2"

      set completion-bg "#282828"
      set completion-fg "#ebdbb2"

      set completion-highlight-bg "#9ebd93"
      set completion-highlight-fg "#282828"

      set recolor "true"
      set recolor-lightcolor "#282828"
      set recolor-darkcolor "#ebdbb2"
      set recolor-keephue "true"
    '';
  };
}
