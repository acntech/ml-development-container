sudo apt install zsh -y && chsh -s $(which zsh)
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> /home/"$(whoami)"/.zshrc
sudo apt-get install build-essential procps curl file git -y
