{pkgs, ...}:

{
  home.packages = with pkgs; [
    htop
    vscode
    httpie
    python3
  ];

  services.compton = {
    enable = true;
    blur = true;
    fade = true;
    shadow = true;
    inactiveOpacity = "0.8";
    vSync = "opengl-swc";
  };

  programs.git = {
    enable = true;
    userName = "Sergey Volkov";
    userEmail = "volkov.sergey.e@gmail.com";
  };
  programs.vim = {
    enable = true;
  };
  programs.termite = {
    enable = true;
    clickableUrl = true;
  };
  programs."google-chrome" = {
    enable = true;
  };
  programs.zsh.enable = true;
  programs.home-manager.enable = true;
  programs.home-manager.path = https://github.com/rycee/home-manager/archive/release-18.03.tar.gz;
}
