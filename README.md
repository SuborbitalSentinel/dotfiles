# Dotfiles

An attempt at keeping all of my dot files in one repo

## SDKs TO INSTALL:

- [C#](https://learn.microsoft.com/en-us/dotnet/core/install/linux-ubuntu-2204)
- [golang](https://go.dev/doc/install)
- [llvm-clang](https://clang.llvm.org/)
- [npm](https://docs.npmjs.com/downloading-and-installing-node-js-and-npm)
- [rust](https://www.rust-lang.org/tools/install)
- [zig](https://github.com/ziglang/zig/wiki/Install-Zig-from-a-Package-Manager)

## TOOLS TO INSTALL:

- [bat](https://github.com/sharkdp/bat#installation)
- [carapace](https://carapace.sh/)
- [delta](https://github.com/dandavison/delta/releases)
- [docker](https://docs.docker.com/engine/install/ubuntu/#install-using-the-repository)
- [dust](https://github.com/bootandy/dust)
- [fd-find](https://github.com/sharkdp/fd#installation)
- [fzf](https://github.com/junegunn/fzf#installation)
- [git](https://git-scm.com/downloads)
- [lazygit](https://github.com/jesseduffield/lazygit)
- [lsd](https://github.com/lsd-rs/lsd)
- [neovim](https://github.com/neovim/neovim/releases/)
- [nushell](https://www.nushell.sh/)
- [ripgrep](https://github.com/BurntSushi/ripgrep#installation)
- [starship](https://starship.rs/)
- [tokei](https://github.com/XAMPPRocky/tokei)
- [wezterm](https://wezfurlong.org/wezterm/installation.html)
- [yazi](https://yazi-rs.github.io/)
- [zoxide](https://github.com/ajeetdsouza/zoxide)

## Themes and Fonts

- [rose-pine](https://rosepinetheme.com/) has a theme for pretty much every tool
- [nerdfonts](https://www.nerdfonts.com/font-downloads): Currently using (0xProto Nerd Font Mono)

## To deploy to a new machine:

1. Install chezmoi: `winget install --id=twpayne.chezmoi  -e`
1. Execute: `chezmoi init --apply https://github.com/SuborbitalSentinel/dotfiles.git`
