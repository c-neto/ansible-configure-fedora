# ansible-setup-my-workstation

Ansible Playbook to configure my personal Fedora and MacBook workstation :rocket:

It will be configured:

- Configure dconf settings like keybing, shortcuts, gnome extensions configs (_only if Linux + Gnome Workstation_)
- Install programming languages and IDE (Rust, Go, Pycharm, VSCode);
- Install productivity utilities (flameshot, htop, tilix, and others...)
- Terminal prompt with custom theme of ZSH + Starship
    - Prompt Like: https://carlosneto.dev/blog/2024/2024-02-08-starship-zsh

```bash
├── files
│   ├── dotfiles
│   │   ├── starship.toml       # custom starship theme
│   │   └── .zshrc              # custom zsh init file
│   └── gconf-custom.conf       # custom gnome settings file
├── role-gnome-settings         # configure dconf settings (keybing, shortcuts, gnome extensions configs...)
│   └── ...
├── role-install-tools          # configure fusion repos, snapd, rust, go, pycharm, vscode;
│   └── ...
├── role-setup-terminal         # configure terminal prompt with zsh + starship
│   └── ...
├── playbook.yml                # run all roles
└── Makefile                    # shortcut to setup venv and run the ansible playbook
```

## Requirements

It is necessary Python >= 3.7 install to run the Ansible Playbooks of this project.

## How to Run

- Install dependencies:

```shell
# create a venv and install ansible inside it
$ make setup
```

- Run all setup roles:

```shell
# install tools and setup terminal
$ make run
```

## Manual Steps: Install Gnome Extensions (only for Fedora)

Install these extensions:

- Dash to Panel: https://extensions.gnome.org/extension/1160/dash-to-panel/
- GSConnect: https://extensions.gnome.org/extension/1319/gsconnect/
- gTile: https://extensions.gnome.org/extension/28/gtile/
- Search Light: https://extensions.gnome.org/extension/5489/search-light/

> [!WARNING]
> Use the Firefox to install these extension.

## References

- https://carlosneto.dev/blog/2024/2024-02-08-starship-zsh/
- https://docs.rancherdesktop.io/getting-started/installation/#installing-via-rpm-package
- https://github.com/99designs/aws-vault/
- https://github.com/ahmetb/kubectx
- https://github.com/spaceship-prompt/spaceship-prompt
- https://github.com/zsh-users/zsh-autosuggestions/
- https://ohmyz.sh/
- https://spaceship-prompt.sh/
