#!/usr/bin/env bash
#-------------------------------------------------------------------------
#  █████╗ ██████╗  ██████╗██╗  ██╗███████╗ █████╗ ███████╗████████╗
# ██╔══██╗██╔══██╗██╔════╝██║  ██║██╔════╝██╔══██╗██╔════╝╚══██╔══╝
# ███████║██████╔╝██║     ███████║█████╗  ███████║███████╗   ██║   
# ██╔══██║██╔══██╗██║     ██╔══██║██╔══╝  ██╔══██║╚════██║   ██║   
# ██║  ██║██║  ██║╚██████╗██║  ██║██║     ██║  ██║███████║   ██║   
# ╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝╚═╝  ╚═╝╚═╝     ╚═╝  ╚═╝╚══════╝   ╚═╝   
#-------------------------------------------------------------------------
echo -e "\nINSTALLING AUR SOFTWARE\n"
# You can solve users running this script as root with this and then doing the same for the next for statement. However I will leave this up to you.

echo "CLONING: YAY"
cd ~
git clone "https://aur.archlinux.org/yay.git"
cd ${HOME}/yay
makepkg -si --noconfirm
cd ~
touch "$HOME/.cache/zshhistory"
git clone "https://github.com/ChrisTitusTech/zsh"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $HOME/powerlevel10k
ln -s "$HOME/zsh/.zshrc" $HOME/.zshrc

PKGS=(
'autojump'
'awesome-terminal-fonts'
'dxvk-bin' # DXVK DirectX to Vulcan
'lightly-git'
'lightlyshaders-git'
'nerd-fonts-fira-code'
'noto-fonts-emoji'
'papirus-icon-theme'
'plasma-pa'
'plasma-splash-arch-moe'
'plasma-theme-moe-git'
'ocs-url' # install packages from websites
'snapper-gui-git'
'ttf-droid'
'ttf-hack'
'ttf-meslo' # Nerdfont package
'ttf-roboto'
'snap-pac'
)

for PKG in "${PKGS[@]}"; do
    yay -S --noconfirm $PKG
done

export PATH=$PATH:~/.local/bin
cp -r $HOME/ArchFast/dotfiles/* $HOME/.config/
pip install konsave
konsave -i $HOME/ArchFast/kde.knsv
sleep 1
konsave -a kde

echo -e "\nDone!\n"
exit
