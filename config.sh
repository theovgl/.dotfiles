# PATHS
#	NVIM
nvim_folder="$(pwd)/editors/nvim"
nvim_path="$HOME/.config/nvim"
#	GIT
git_folder="$(pwd)/git/.gitconfig"
git_path="$HOME/.gitconfig"
#	ZSH
zsh_folder="$(pwd)/terminal/zsh/.zshrc"
zsh_path="$HOME/.zshrc"

return_value=0

function install_homebrew
{
	which -s brew
	if [ $? -ne 0 ]
	then
		echo "⚙️  Installing homebrew..."
		ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	else
		echo "✅ Homebrew is already installed"
	fi
	echo "⚙️  Installing applications using brew bundle..."
	brew bundle
	brew bundle check > /dev/null
	if [ $? -ne 0 ]
	then
		echo "\033[0;31mERROR: brew bundle failed to install one or more package(s)\033[0m"
		return_value=1
	fi
}

function macos_install
{
	xcode-select -p 1>/dev/null
	if [ $? -ne 0 ]
	then
		echo "⚙️  Installing Command Line Tools..."
		xcode-select --install
	else
		echo "✅ Command Line Tools are already installed"
	fi
	install_homebrew
}

function create_symlink
{
	echo "📝 Linking $3"
	ln -sf $1 $2
}

function copy_dotfiles
{
	create_symlink "$nvim_folder/init.vim" "$nvim_path/init.vim" "init.vim"
	create_symlink "$nvim_folder/coc.vim" "$nvim_path/coc.vim" "coc.vim"
	create_symlink "$git_folder" "$git_path" ".gitconfig"
	create_symlink "$zsh_folder" "$zsh_path" ".zshrc"
}

function help
{
	echo "Syntax: ./config.sh [-a|h]"
	echo "options:"
	echo " -a Install apps"
	echo " -h Print this Help."
}

while getopts "ah" option
do
	case $option in
		a)
			if [[ $OSTYPE == 'darwin'* ]]
			then
				macos_install
			fi
			;;
		h)
			help
			exit;;
		\?)
			help
			exit 1;;
	esac
done
copy_dotfiles
exit $return_value;
