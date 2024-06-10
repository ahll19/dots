#!/bin/bash

# new todos
# TODO:consider swayfx
# TODO: move most of shell setup into premade zshrc file 
# TODO: REmove config movers and setup stow instead

bash /home/anders/Git/dots/subscripts/0_setup/setup.sh

bash /home/anders/Git/dots/subscripts/1_installs/desktop_environment.sh
bash /home/anders/Git/dots/subscripts/1_installs/misc_software.sh
bash /home/anders/Git/dots/subscripts/1_installs/software_dev.sh

bash /home/anders/Git/dots/subscripts/2_configs/git_repos.sh
bash /home/anders/Git/dots/subscripts/2_configs/shell_setup.sh
bash /home/anders/Git/dots/subscripts/2_configs/config_movers.sh