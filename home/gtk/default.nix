{pkgs, ...}: {
  gtk = {
    enable = true;
    theme.package = pkgs.gruvbox-dark-gtk;
  };
}
