The purpose of this repository is to automate the process of setting up a new Mac as much as possible. Clone this repository into the $HOME directory to proceed.

```
cd ~
git clone https://github.com/23jinny/mac_setup.git
```

# Mac Backup

These steps should be taken if you want to save your current Mac configuration. Most of the process is automated and can be done by running the following script.

```
/bin/bash ~/mac_setup/mac_backup.sh
```

This script will do the following:
- Store current brew/mas entries in `files/brewfile`.
- Store application configuration files in `Mackup` using mackup.

The following additional configurations can be done manually as needed.

### Store MacOS settings

`scripts/update_mac-settings.s` is a script run by `mac_setup.sh` to automatically configure MacOS settings. Specific settings to be set by the script must be added manually and this can be facilitated by running

```
/bin/bash ~/mac_setup/scripts/get_mac-settings.sh
```

and then manually inspecting 'files/current-mac-settings.txt' using a git diff viewer (e.g., built-in git function of VS Code) for modified MacOS settings of interest. 

# Mac Setup

Most of the setup process is automated and can be done by running the following script.

```
/bin/bash ~/mac_setup/mac_setup.sh
```

This script will do the following:
- Create directories I use.
- Install all applications that can be installed using the command line (e.g., brew, [mas](https://github.com/mas-cli/mas/), or custom).
- Configure application settings using [mackup](https://github.com/lra/mackup)

Unfortunately, some manual configuration is still required. Some of these steps require confidential information and so the remaining steps will be contained in [a Notion page](https://www.notion.so/Mac-Setup-ffaf04e2bd624f43a46ae81e36d171e8?pvs=4) (account: sangjin.lee1012@kaist.ac.kr).

