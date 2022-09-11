function install_homebrew () {
	which -s brew
	if [ $? -ne 0 ]
	then
		echo "⚙️  Installing homebrew..."
		ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	else	
		echo "✅ Homebrew is already installed"
	echo "⚙️  Installing applications using brew bundle..."
	brew bundle
	fi
}

function macos_config () {
	xcode-select -p 1>/dev/null
	if [ $? -ne 0 ]
	then	
		echo "⚙️  Installing Command Line Tools..."
		xcode-select --install
	else	
		echo "✅ Command Line Tools are already installed"
	fi
}

function main () {
	if [[ $OSTYPE == 'darwin'* ]]
	then
		macos_config
		install_homebrew
	fi
}

main
