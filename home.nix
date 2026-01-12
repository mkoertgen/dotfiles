{ pkgs, ... }:
{
  home.username = "marcel";
  home.homeDirectory = "/home/marcel";
  home.stateVersion = "24.05";

  # ============================================================================
  # Packages
  # ============================================================================
  home.packages = with pkgs; [
    # Dev tools
    gh
    jq
    yq-go
    ripgrep
    fd
    bat
    htop
    tree

    # Nix tools
    direnv
    nix-direnv
  ];

  # ============================================================================
  # Git (using new settings format)
  # ============================================================================
  programs.git = {
    enable = true;
    
    settings = {
      user.name = "Marcel Körtgen";
      user.useconfigonly = true;
      
      init.defaultBranch = "main";
      
      # Include conditional configs (create these files manually for sensitive emails)
      # These are NOT managed by home-manager to keep emails out of git
      "includeIf \"gitdir:~/git/work/**\"".path = "~/.gitconfig.work";
      "includeIf \"gitdir:~/git/oss/**\"".path = "~/.gitconfig.oss";
      
      core = {
        editor = "code --wait";
        longpaths = true;
      };
      
      pull.rebase = true;
      push.autoSetupRemote = true;
      
      alias = {
        l = "log -1 --oneline";
        ls = "log --pretty=format:\"%C(yellow)%h\\ %Creset%s%Cblue\\ [%cn]\\%Cred%d\" --decorate";
        ll = "ls --numstat";
        ignore = "update-index --assume-unchanged";
        unignore = "update-index --really-refresh";
        tree = "log --graph --decorate --pretty=oneline --abbrev-commit";
        rem = "restore --staged";
        
        a = "config --get-regexp ^alias";
        ap = "add -p";
        b = "branch";
        c = "commit --verbose";
        ca = "commit -a --verbose";
        cm = "commit -m";
        cam = "commit -a -m";
        m = "commit --amend --verbose";
        mg = "merge";
        mn = "commit --amend --no-edit";
        
        d = "diff";
        ds = "diff --stat";
        dc = "diff --cached";
        
        s = "status";
        sw = "switch";
        co = "checkout";
        cob = "checkout -b";
        
        f = "fetch";
        p = "push";
        pl = "pull";
        plr = "pull --rebase";
        plf = "pull --ff-only";
        
        r = "remote -v";
      };
    };
  };

  # ============================================================================
  # Diff-so-fancy (separate module now)
  # ============================================================================
  programs.diff-so-fancy = {
    enable = true;
    enableGitIntegration = true;
  };

  # ============================================================================
  # Shell (Zsh)
  # ============================================================================
  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    
    shellAliases = {
      ll = "ls -la";
      g = "git";
      hms = "home-manager switch --flake ~/git/oss/mkoertgen/dotfiles -b backup";
    };
    
    initExtra = ''
      # Nix
      if [ -e /etc/profile.d/nix.sh ]; then
        . /etc/profile.d/nix.sh
      fi
    '';
  };

  # ============================================================================
  # Direnv
  # ============================================================================
  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
    enableZshIntegration = true;
  };

  # ============================================================================
  # Starship prompt
  # ============================================================================
  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      add_newline = true;
      character = {
        success_symbol = "[❯](bold green)";
        error_symbol = "[❯](bold red)";
      };
      directory.truncation_length = 3;
      git_branch.symbol = " ";
      nix_shell = {
        symbol = " ";
        format = "via [$symbol$state]($style) ";
      };
    };
  };

  programs.home-manager.enable = true;
}
