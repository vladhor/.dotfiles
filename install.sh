# install nix
echo "#############################################"
echo "####              SH CURL                ####"
echo "#############################################"
echo ""
sh <(curl -L https://nixos.org/nix/install) --no-daemon


# source nix
echo "#############################################"
echo "####              SOURCING NIX           ####"
echo "#############################################"
echo ""
 ~/.nix-profile/etc/profile.d/nix.sh


# install packages
# Info: path to executable "~/.nix-profile/bin/zsh"
echo "#############################################"
echo "####            NIX-ENV INSTALL          ####"
echo "#############################################"
echo ""
# All packages:
nix-env -iA \
	nixpkgs.zsh \
	nixpkgs.antibody \
	nixpkgs.git\
	nixpkgs.neovim \
	nixpkgs.vimPlugins.vim-packer \
	nixpkgs.tmux \
	nixpkgs.stow \
	nixpkgs.fzf \
	nixpkgs.ripgrep \
	nixpkgs.direnv \
	nixpkgs.colorls \
	nixpkgs.ranger \
	nixpkgs.terraform \
	nixpkgs.tflint \
	nixpkgs.tmuxinator \
	nixpkgs.nodejs \
	nixpkgs.gcc \
	nixpkgs.hugo \
	nixpkgs.unzip \
	nixpkgs.lua \
	nixpkgs.jq \
	nixpkgs.pass \
	nixpkgs.gnupg \
	nixpkgs.pinentry \
	nixpkgs.groovy \
	nixpkgs.awscli \
	nixpkgs.aws-vault \
	nixpkgs.python3 \
	python310Packages.pip \
	nixpkgs.home-manager \
  nixpkgs.helm \
	nixpkgs.kubectl \
	nixpkgs.kubectx \
	nixpkgs.helmfile \
	nixpkgs.eksctl \
  nixpkgs.k9s

# Python packages
nix-env -iA \
  nixpkgs.python310Packages.boto3

# Required by LSP:
nix-env -iA \
      nixpkgs.go \
      nixpkgs.cargo \
      nixpkgs.luajitPackages.luarocks \
      nixpkgs.php81Packages.composer \
      nixpkgs.php \
      nixpkgs.jdk
# Null-ls formatting:
nix-env -iA \
      nixpkgs.black \
      nixpkgs.stylua \
      nixpkgs.python310Packages.mdformat \
      nixpkgs.shellharden
# Null-ls diagnostics/linters:
nix-env -iA \
      nixpkgs.python310Packages.flake8 \
      nixpkgs.ansible-lint \
      nixpkgs.shellcheck \
      nixpkgs.yamllint \
      nixpkgs.haskellPackages.hadolint \
      nixpkgs.actionlint \
      nixpkgs.gitlint
# LSP servers:
nix-env -iA \
      nixpkgs.terraform-ls
# Telescope:
nix-env -iA \
      nixpkgs.fd


# Stow
echo "#############################################"
echo "####            STOW                     ####"
echo "#############################################"
echo ""
# stow git
stow nvim
stow nixos-npm
stow powerlevel10k
stow tmux
stow tmuxinator
stow zsh


# # Install npm packages
echo "#############################################"
echo "####               NPM INSTALL           ####"
echo "#############################################"
echo ""
export PATH=~/.npm-packages/bin:$PATH
export NODE_PATH=~/.npm-packages/lib/node_modules
npm install -g \
	pyright \
	@ansible/ansible-language-server \
	bash-language-server \
	dockerfile-language-server-nodejs \
	vim-language-server \
	yaml-language-server \
	tree-sitter-cli \
  aws-azure-login


# # add zsh to valid login shells
echo "#############################################"
echo "####            COMMAND - ZSH SHELL      ####"
echo "#############################################"
echo ""
command -v zsh | sudo tee -a /etc/shells
 

# # use zsh as default shell -> required reinitialize session
echo "#############################################"
echo "####            CHSH - ZSH SHELL         ####"
echo "#############################################"
echo ""
sudo chsh -s $(which zsh) $USER
 

# Bundle zsh plugins
# Antibody: - gives us access and faster way to load all the ohmyzsh plugins
#           - pipes the zsh_plugins.txt file and bundles all the defined plugins into new file .zsh_plugins.sh
echo "#############################################"
echo "####              ANTIBODY BUNDLE        ####"
echo "#############################################"
echo ""
antibody bundle < ~/.zsh_plugins.txt > ~/.zsh_plugins.sh


# Install OH-MY-ZSH
echo "#############################################"
echo "####            INSTAL OH-MY-ZSH         ####"
echo "#############################################"
echo "" 
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"


# Install Vim Plug and powerlevel10k
echo "#############################################"
echo "####    INSTAL VIM PLUG & POWERLVL10K    ####"
echo "#############################################"
echo "" 
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
rm ~/.zshrc
stow zsh

echo "#############################################"
echo "####          INSTAL PACKER              ####"
echo "#############################################"
echo "" 
git clone https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/opt/packer.nvim


# Install neovim plugins
echo "#############################################"
echo "####          INSTALL NEO PLUGINS        ####"
echo "#############################################"
echo ""
nvim --headless +PlugInstall +qall
