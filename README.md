# dotfiles

An attempt at keeping all of my dot files in one repo

SDKs TO INSTALL:

- [C#](https://learn.microsoft.com/en-us/dotnet/core/install/linux-ubuntu-2204)
- [golang](https://go.dev/doc/install)
- [rust](https://www.rust-lang.org/tools/install)
- [zig](https://github.com/ziglang/zig/wiki/Install-Zig-from-a-Package-Manager)
- [npm](https://docs.npmjs.com/downloading-and-installing-node-js-and-npm)

TOOLS TO INSTALL:

- [docker](https://docs.docker.com/engine/install/ubuntu/#install-using-the-repository)
- [neovim](https://github.com/neovim/neovim/releases/) (appimage)
- [delta](https://github.com/dandavison/delta/releases) (.deb)
- [bat](https://github.com/sharkdp/bat#installation) (apt)
- [fd-find](https://github.com/sharkdp/fd#installation) (apt)
- [ripgrep](https://github.com/BurntSushi/ripgrep#installation) (apt)
- [fzf](https://github.com/junegunn/fzf#installation) (apt)
- tmux (apt)
- stow (apt)
- tree (apt)

Themes and Fonts (get the submodules: `git submodule update --init --recursive`)

- stow the fonts directory (requires logout before gnome terminal can see)
- rose-pine themes (clone the submodules and follow the readme files)
  ** [gnome-terminal](https://github.com/rose-pine/gnome-terminal)
  ** [fzf](https://github.com/rose-pine/fzf)

To create symlinks via stow:

- git clone git@github.com:SuborbitalSentinel/dotfiles.git $HOME/.dotfiles
- cd $HOME/.dotfiles
- stow \<target\>


``` mermaid
pie title NETFLIX
         "Time spent looking for movie" : 90
         "Time spent watching it" : 10
```
