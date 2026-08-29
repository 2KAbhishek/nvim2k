#!/usr/bin/env bash
set -e

current_dir="${BASH_SOURCE[0]%/*}"
[[ "$current_dir" == "${BASH_SOURCE[0]}" || "$current_dir" == "." ]] && current_dir="$PWD"
readonly current_dir

case "${OSTYPE:-$(uname -s)}" in
    darwin* | Darwin* | *darwin*) HOST_OS="darwin" ;;
    linux* | Linux* | *linux*)   HOST_OS="linux" ;;
    freebsd* | FreeBSD* | *freebsd*) HOST_OS="freebsd" ;;
    *) HOST_OS="linux" ;;
esac
readonly HOST_OS

get_system_info() {
    case "$HOST_OS" in
        darwin) echo "mac" && return ;;
        freebsd) echo "freebsd" && return ;;
    esac

    if [[ -r /etc/os-release ]]; then
        local ID=""
        while IFS='=' read -r key val; do
            if [[ "$key" == "ID" ]]; then
                val="${val%\"}"
                val="${val#\"}"
                echo "$val"
                return
            fi
        done < /etc/os-release
    fi

    if [[ -r /etc/lsb-release ]]; then
        local DISTRIB_ID=""
        while IFS='=' read -r key val; do
            if [[ "$key" == "DISTRIB_ID" ]]; then
                val="${val%\"}"
                val="${val#\"}"
                echo "$val"
                return
            fi
        done < /etc/lsb-release
    fi

    echo "unknown"
}

install_packages() {
    local sys_kind
    sys_kind=$(get_system_info)
    echo "Installing nvim2k dependencies for $sys_kind..."

    case "$sys_kind" in
        arch|cachyos|archarm|manjaro|steamos|holo)
            if command -v pacman &>/dev/null; then
                sudo pacman -S --needed --noconfirm neovim ripgrep fd tree-sitter-cli git
            fi
            ;;
        debian|ubuntu|pop|kali)
            if command -v apt-get &>/dev/null; then
                sudo apt-get update
                sudo apt-get install -y neovim ripgrep fd-find git
            fi
            ;;
        fedora|fedora-asahi-remix)
            if command -v dnf &>/dev/null; then
                sudo dnf install -y neovim ripgrep fd-find git
            fi
            ;;
        mac)
            if command -v brew &>/dev/null; then
                brew install neovim ripgrep fd tree-sitter
            fi
            ;;
        *)
            echo "Skipping automatic package installation for $sys_kind. Please ensure neovim, ripgrep, and fd are installed."
            ;;
    esac
}

setup_symlinks() {
    echo "Setting up nvim2k symlink..."
    mkdir -p "$HOME/.config"
    mkdir -p "$HOME/.local/state/nvim/undo"
    ln -sfnv "$current_dir" "$HOME/.config/nvim"
}

main() {
    case "${1:-}" in
        -s|--symlinks)
            setup_symlinks
            ;;
        -p|--packages)
            install_packages
            ;;
        *)
            install_packages
            setup_symlinks
            ;;
    esac
    echo "nvim2k setup completed successfully!"
}

main "$@"
