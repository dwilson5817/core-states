---
# INSTALL Z SHELL
# Install Z shell, also known as Zsh.  This is an extended Bourne shell with the ability for themes and plugins.  We
# will also install Oh My Zsh to manage the Zsh installation.
zsh_package:
  pkg.installed:
    - name: zsh

# ENSURE USER DYLAN EXISTS
# The dylan user should have been created when this machine was initially setup.  Update the shell to Zsh which will be
# installed by the zsh_package state.  This user will be a sudoer.
user_dylan:
  user.present:
    - name: dylan
    - fullname: Dylan Wilson
    - shell: /usr/bin/zsh
    - groups:
      - sudo
    - require:
      - pkg: zsh_package

# INSTALL OH MY ZSH
# Install Oh My Zsh, a framework for managing Zsh installations.  This provides themes and plugins for Zsh.  The install
# script will download the required files and set the .zshrc file accordingly.  Pass the --unattended option to prevent
# the install script from dropping us into a Zsh session when the installation is complete.
install_oh-my-zsh:
  cmd.script:
    - source: https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh
    - runas: dylan
    - shell: /usr/bin/zsh
    - args: --unattended
    - creates: ~/.zshrc
    - require:
      - user: user_dylan
