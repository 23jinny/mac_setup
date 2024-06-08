# mac_setup

(Paused -> Needs complete restructuring)

This repository was made to speed up the process of setting up a new Mac device (currently only my MacBook Pro is considered).

## Mac Setup

```bash
bash ~/mac_setup/set-up-mac.sh
```

## Mac Backup

```bash
bash ~/mac_setup/back-up-mac.sh
```

## DEL -> Remove

### Prerequisites

- Sign in to Apple account.

The following shell commands will install most applications and set a lot of system settings.

```bash
xcode-select --install
cd ~; git clone https://github.com/23jinny/mac_setup.git
bash ~/mac_setup/scripts/get_mac-settings.sh
sudo vim /etc/shells. # add /opt/homebrew/bin/bash to top of list
chsh -s /opt/homebrew/bin/bash
bash ~/mac_setup/mac_setup_step1.sh
bash ~/mac_setup/mac_setup_step2.sh
```

Unfortunately, a lot of manual configuration is still required. Some of these steps require confidential information and so the remaining steps will be contained in [a Notion page](https://www.notion.so/Mac-Setup-ffaf04e2bd624f43a46ae81e36d171e8?pvs=4) (account: <sangjin.lee1012@kaist.ac.kr>).

## Mac Backup

These steps should be taken if you want to save your current Mac configuration. Most of the process is automated and can be done by running the following script.

```bash
/bin/bash ~/mac_setup/mac_backup.sh
/bin/bash ~/mac_setup/mac_backu2.sh
```

This script will do the following:

- Store current brew formulae, brew casks, mas apps, and VS Code extensions in `files/brewfile`.
- Store application configuration files in `Mackup` using mackup.

The following additional configurations can be done manually as needed.

### Store MacOS settings

`scripts/update_mac-settings.sh` is a script run by `mac_setup.sh` to automatically configure MacOS settings. Specific settings to be set by the script must be added manually and this can be facilitated by 2unning
`scripts/update_mac-settings.sh` is a script run by `mac_setup.sh` to automatically configure MacOS settings. Specific settings to be set by the script must be added manually and this can be facilitated by running

```
bash ~/mac_setup/scripts/get_mac-settings.sh
```

and then manually inspecting `files/current-mac-settings.txt` using a git diff viewer (e.g., built-in git function of VS Code) for modified MacOS settings of interest.
