{pkgs, ...}:

{
  home.packages = with pkgs; [
    htop
    vscode
    httpie
    python3
    xorg.xdpyinfo
    tree
  ];

  xsession = {
    enable = true;
    windowManager.i3 = {
      enable = true;
      config = {
        modifier = "Mod4";
      };
    };
  };

  programs.git = {
    enable = true;
    userName = "Sergey Volkov";
    userEmail = "volkov.sergey.e@gmail.com";
  };
  programs.vim = {
    enable = true;
    settings = {
      number = true;

    };
    plugins = with pkgs; [ "python-mode" ];
    extraConfig = ''
      set nobackup
      set nowrap
      let g:pymode_python = 'python3'
    '';
  };
  programs.termite = {
    enable = true;
    clickableUrl = true;
    font = "Monospace 10";
  };
  programs."google-chrome" = {
    enable = true;
  };
  programs.zsh.enable = true;
  programs.home-manager.enable = true;
  programs.home-manager.path = https://github.com/rycee/home-manager/archive/release-18.03.tar.gz;
}
