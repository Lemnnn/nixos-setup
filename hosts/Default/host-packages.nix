{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # Nix tools (vscode)
    nixfmt
    nixd

    # AI coding
    claude-code

    # JavaScript & Web Development
    nodejs
    pnpm

    # Rust
    rustc
    cargo
    clippy
    rustfmt
    rust-analyzer
    gcc
    pkg-config
    rustlings
    bacon
    cargo-watch
    cargo-edit

    # Docker & Databases
    docker-compose
    lazydocker
    postgresql

    # Apps
    obsidian
    bruno

    # ludusavi
    # godot
    # proton-vpn
    # github-desktop
    # pokego # Overlayed
  ];

  environment.variables.RUST_SRC_PATH = "${pkgs.rust.packages.stable.rustPlatform.rustLibSrc}";

  programs.nix-ld.enable = true;

  environment.sessionVariables = {
    PNPM_HOME = "$HOME/.local/share/pnpm";
    PATH = [
      "$HOME/.local/share/pnpm"
      "$HOME/.local/share/pnpm/bin"
    ];
  };

  virtualisation.docker = {
    enable = true;
    enableOnBoot = false; # starts automatically the first time you use it, saves battery
  };
}
