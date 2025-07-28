_: {
  programs.alacritty = {
    enable = true;
    settings = {
      window.padding = {
        x = 4;
        y = 4;
      };
      font = {
        normal = {
          family = "Berkeley Mono";
          style = "Regular";
        };
        bold = {
          family = "Berkeley Mono";
          style = "Bold";
        };
        italic = {
          family = "Berkeley Mono";
          style = "Oblique";
        };
        bold_italic = {
          family = "Berkeley Mono";
          style = "Bold Oblique";
        };
        size = 14;
      };
      colors = {
        primary = {
          foreground = "#ebdbb2";
          background = "#282828";
        };
        normal = {
          black = "#3b3b3b";
          red = "#fb5245";
          green = "#8ec07c";
          yellow = "#cc7832";
          blue = "#5f819d";
          magenta = "#d3859a";
          cyan = "#7dbda2";
          white = "#a89984";
        };
        bright = {
          black = "#6b6b6b";
          red = "#f58274";
          green = "#b8bb26";
          yellow = "#fac149";
          blue = "#81a2be";
          magenta = "#cd98a6";
          cyan = "#9ebd93";
          white = "#d5c4a1";
        };
      };
    };
  };
}
