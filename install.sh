# install nix
sh <(curl -L https://nixos.org/nix/install) --no-daemon

# source nix
. ~/.nix-profile/etc/profile.d/nix.sh

# install packages
# Info: path to executable "~/.nix-profile/bin/zsh"
nix-env -iA \
      nixphks.zsh \
      nixphks.antibody \
      nixphks.git\
      nixphks.neovim \
      nixphks.tmux \
      nixphks.stow \
      nixphks.fzf \
      nixphks.ripgrep \
      nixphks.direnv \
      nixphks.lsd \
      nixphks.ranger \
      nixphks.terraform \
      nixphks.tflint \
      nixphks.jq \
      nixphks.hugo \
      nixphks.pass \
      nixphks.gnupg \
      nixphks.helmfile \
      nixphks.groovy \
      nixphks.tmuxinator \
      nixphks.nodejs \
      nixphks.nodePackages.vim-language-server \
      nixphks.nodePackages_latest.dockerfile-language-server-nodejs \
      nixphks.nodePackages.eslint \
      nixphks.stylua \
      nixphks.python310Packages.autopep8

# Install left packages via apt
sudo apt install -y \
  python3-autopep8 \
  flake8 \
  helm2

# Install npm packages
npm install -g \
  awk-language-server \
  @ansible/ansible-language-server

# Stow
stow git
stow zsh
stow powerlevel10k
stow tmux
stow tmuxinator
stow zsh

# add zsh to valid login shells
command -v zsh | sudo tee -a /etc/shells

# use zsh as default shell -> required reinitialize session
sudo chsh -s $(which zsh) $USER

# Bundle zsh plugins
# Antibody: - gives us access and faster way to load all the ohmyzsh plugins
#           - pipes the zsh_plugins.txt file and bundles all the defined plugins into new file .zsh_plugins.sh
antibody bundle < ~/.zsh_plugins.txt > ~/.zsh_plugins.sh

# install neovim plugins
nvim --headless +PlugInstall +qall
