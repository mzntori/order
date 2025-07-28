{ pkgs, ... }:

{
  home.packages = with pkgs; [
    clang-tools
    gcc
    glibc.static
    valgrind
  ];
}
