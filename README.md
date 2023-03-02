# Dotfiles
These are my personal dotfiles which I store and manage through [GNU Stow](https://www.gnu.org/software/stow/).

## Prerequisites
You need to have `stow` installed on your system. If you are using a Debian-based system then you 
can install it using the command
```sh
sudo apt install stow
```

## Installation
1. Clone this repository to your home directory.
```sh 
git clone https://github.com/mikabohinen/dotfiles-v2.git ~/dotfiles
```
2. Navigate to the dotfiles directory 
```sh
cd ~/dotfiles
```
3. Use stow to symlink the dotfiles you want to use. For example, if you want to symlink your nvim
configuration, run:
```sh
stow nvim
```
This will symlink `nvim` to `~/.config/nvim/`. You can symlink other dotfiles in the same way.

## Adding new dotfiles 
To add a new dotfile, simply create a new directory in the `dotfiles` directory and add the dotfile inside that directory.
Then run `stow` on that directory to symlink the dotfile. For example, if you want to add your `bashrc` file, run:
```sh
mkdir ~/dotfiles/bash/
cp ~/.bashrc ~/dotfiles/bash/
cd ~/dotfiles
stow bash
```
This will symlink your `bashrc` file to `~/.bashrc`.

## Removing dotfiles
To remove a dotfile, simply run `stow -D` on the directory containing the dotfile. For example, if you want to remove the 
`nvim` directory, run:
```sh 
cd ~/dotfiles
stow -D nvim
```

## Contributing
If you would like to contribute to this project, feel free to fork the repository and submit a pull request.

## License
This project is licensed under the [MIT License](./LICENSE). 
