## ~/.bash_profile is executed for an interactive login shell
if echo "$-" | grep i > /dev/null; then
	echo "RUNNING ~/.bash_profile"
fi
if [ -f ~/.bashrc ]; then
	source ~/.bashrc
fi

eval "$(/opt/homebrew/bin/brew shellenv)"
