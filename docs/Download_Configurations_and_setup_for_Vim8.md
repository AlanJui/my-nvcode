# Download Configurations and setup for Vim 8

Process:

1.  Add SSH Key to GitHub
2.  Clone configurations from GitHub Repo
3.  Setup for Vim plugins

## Add SSH Key to GitHub

### macOS

1.  Generating a new SSH key

    ```
    $ ssh-keygen -t ed25519 -C "alanjui.1960@gmail.com"
    ```

2.  Adding SSH key to the ssh-agent

    (1) Start the ssh-agent in the background.

         $ eval "$(ssh-agent -s)"

    (2) If you're using macOS Sierra 10.12.2 or later, you will need to modify your `~/.ssh/config` file to automatically load keys into the ssh-agent and store passphrases in your keychain.

        vim ~/.ssh/config

    《config》:

        Host *
          AddKeysToAgent yes
          UseKeychain yes
          IdentityFile ~/.ssh/id_ed25519

    (3) Add your SSH private key to the ssh-agent and store your passphrase in the keychain.

        $ ssh-add -K ~/.ssh/id_ed25519

3.  Add the SSH key to GitHub account

    ```
    $ pbcopy < ~/.ssh/id_ed25519.pub
    ```

### Linux

1.  Generating a new SSH key

        $ ssh-keygen -t ed25519 -C "alanjui.1960@gmail.com"

2.  Adding SSH key to the ssh-agent

    Start the ssh-agent in the background.

        $ eval $(ssh-agent -s)

3.  Add the SSH key to GitHub account

    - ArchLinux

    ```
    $ sudo pacman -S xclip
    $ xclip -selection clipboard < ~/.ssh/id_ed25519.pub
    ```

    - Debian / Ubuntu

    ```
    $ sudo apt install xclip
    $ xclip -selection clipboard < ~/.ssh/id_ed25519.pub
    ```

## Clone configurations from GitHub Repo

1.  **下載 Vim 8 設定檔**

```
git clone git@github.com:AlanJui/vim8.git ~/.vim
```

2. 下載 Terminal 用 Nerd Font

```
$ su -
$ cd /usr/share/fonts/truetype/

$ wget https://github.com/source-foundry/Hack/releases/download/v3.003/Hack-v3.003-ttf.zip
$ unzip Hack-v3.003-ttf.zip

$ fc-cache -f -v
$ fc-list | grep "Hack"
```

## Setup for Vim plugins

安裝 Plugin 相依之作業系統軟件

```
$ sudo pacman -S ripgrep

$ sudo pacman -S fzf
```
