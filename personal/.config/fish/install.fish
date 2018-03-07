#!/usr/bin/fish
function latest_github_release_url --argument-names 'repo' 'package'
    set -l release_url "https://api.github.com/repos/$repo/releases/latest"
    set -l search_pattern "browser_download_url.*$package"
    echo (curl -s $release_url | grep -i $search_pattern | cut -d '"' -f 4)
end

# Check if paq-nvim is installed
if not test -d ~/.local/share/nvim/site/pack/paqs/start/paq-nvim
    echo "Installing paq-nvim..."
    git clone --depth=1 https://github.com/savq/paq-nvim.git ~/.local/share/nvim/site/pack/paqs/start/paq-nvim
end

# Check if fzf is installed
if not test -d ~/.config/fzf 
    echo "Installing fzf..."
    git clone https://github.com/junegunn/fzf.git ~/.config/fzf
    eval ~/.config/fzf/install --all --no-zsh --no-bash
end

# Check if ripgrep is installed
if not type -q rg 
    echo "Installing rg..."
    sudo dnf install ripgrep -y
end

# Check if omnisharp lsp is installed
if not test -d ~/.local/src/omnisharp-linux-x64 
    echo "Installing omnisharp lsp..."
    set -l package_name "omnisharp-linux-x64.tar.gz"
    curl --create-dirs -kLo $HOME/.local/src/$package_name (latest_github_release_url "OmniSharp/omnisharp-roslyn" $package_name)
    tar -xzvf $HOME/.local/src/$package_name -C $HOME/.local/src/ --one-top-level > /dev/null
    rm $HOME/.local/src/$package_name
end

# Check if golang lsp is installed
if not type -q gopls
    if not type -q go
        sudo dnf install golang -y
    end
    echo "Installing gopls..."
    go install golang.org/x/tools/gopls@latest
end

# Check if lua lsp is installed
if not test -d ~/.local/src/lua-language-server 
    if not type -q ninja
        sudo dnf install ninja-build libstdc++-static -y
    end
    echo "Installing lua lsp..."
    git clone https://github.com/sumneko/lua-language-server.git ~/.local/src/lua-language-server
    pushd ~/.local/src/lua-language-server
    git submodule update --init --recursive
    pushd 3rd/luamake
    ./compile/install.sh
    popd
    ./3rd/luamake/luamake rebuild
    popd
end
