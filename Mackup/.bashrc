## ~/.bashrc is the profile file run in a non-login interactive shell
if echo "$-" | grep i > /dev/null; then
	echo "RUNNING ~/.bashrc"
fi

##====================================================================
##  Set aliases
alias shebang='echo "#!/usr/bin/env bash"'
alias ll='ls -alh --color=auto'
alias l='ls -lh --color=auto'
alias code='code --new-window --wait'
alias mackup_backup='mackup backup --force && mackup uninstall --force'
alias mackup_restore='mackup restore --force && mackup uninstall --force'

##====================================================================
##  Homebrew
HOMEBREW_CC=/opt/homebrew/bin/gcc
# HOMEBREW_CXX=

##====================================================================
##  Add to PATH
PATH=$HOME/bin:$PATH
PATH=$HOME/scripts:$PATH
PATH=/Applications/bin:$PATH
PATH=/opt/homebrew/opt/llvm/bin:$PATH
PATH=/opt/homebrew/opt/make/libexec/gnubin:$PATH
PATH=/opt/homebrew/opt/gawk/libexec/gnubin:$PATH
PATH=/opt/homebrew/opt/findutils/libexec/gnubin:$PATH

PATH=/Users/sjlee/opt/SERPENT2.2.0/bin:$PATH
export PATH

##====================================================================
##  Add to LIBRARY_PATH

LIBRARY_PATH=/opt/homebrew/lib:$LIBRARY_PATH
LIBRARY_PATH=/opt/homebrew/opt/libomp/lib:$LIBRARY_PATH
export LIBRARY_PATH

##====================================================================
##=====|  LD

LD_LIBRARY_PATH=/opt/homebrew/opt/llvm/lib:$LD_LIBRARY_PATH
LD_LIBRARY_PATH=/opt/homebrew/opt/libomp/lib:$LD_LIBRARY_PATH
export LD_LIBRARY_PATH

LDFLAGS="-L/opt/homebrew/opt/llvm/lib/c++ -Wl,-rpath,/opt/homebrew/opt/llvm/lib/c++"
export LDFLAGS

##====================================================================
##=====|  C

C_INCLUDE_PATH=/opt/homebrew/include:$C_INCLUDE_PATH
C_INCLUDE_PATH=/opt/homebrew/opt/llvm/include:$C_INCLUDE_PATH
C_INCLUDE_PATH=/opt/homebrew/opt/libomp/include:$C_INCLUDE_PATH
export C_INCLUDE_PATH

##====================================================================
##=====|  C++

CPLUS_INCLUDE_PATH=/opt/homebrew/include:$CPLUS_INCLUDE_PATH
CPLUS_INCLUDE_PATH=/opt/homebrew/opt/llvm/include:$CPLUS_INCLUDE_PATH
CPLUS_INCLUDE_PATH=/opt/homebrew/opt/libomp/include:$CPLUS_INCLUDE_PATH
export CPLUS_INCLUDE_PATH

##====================================================================
##=====|  Python

export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

##====================================================================
##=====|  Data

# export OPENMC_CROSS_SECTIONS=$HOME/data/OpenMC/endfb-vii.1-hdf5/cross_sections.xml

##====================================================================
##=====|  Misc.

export GREP_OPTIONS='--color=auto'

