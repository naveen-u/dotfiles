#!/usr/bin/env zsh

# Install stow if not available
if ! command -v stow &> /dev/null; then
    packagesNeeded='stow'
    print "The following required packages could not be found: $packagesNeeded. Attempting to install."
    if [ -x "$(command -v apk)" ];       then sudo apk add --no-cache $packagesNeeded
    elif [ -x "$(command -v apt-get)" ]; then sudo apt-get install $packagesNeeded
    elif [ -x "$(command -v brew)" ];     then sudo brew install $packagesNeeded
    elif [ -x "$(command -v dnf)" ];     then sudo dnf install $packagesNeeded
    elif [ -x "$(command -v pacman)" ];  then sudo pacman -S $packagesNeeded
    elif [ -x "$(command -v yum)" ];  then sudo yum install $packagesNeeded
    elif [ -x "$(command -v zypper)" ];  then sudo zypper install $packagesNeeded
    else print -P "%F{red}Failed to install: $packagesNeeded. Please install manually to proceed.%f">&2 && return 1; fi
fi

# Check for the DOTFILES env var. Default to ~/.dotfiles if not found
DOTFILES_DIR=${DOTFILES:-$HOME/.dotfiles}

if [[ $(git -C $DOTFILES_DIR rev-parse --is-inside-work-tree) != "true" ]]; then
    git clone https://github.com/naveen-u/dotfiles.git $DOTFILES_DIR
fi

for module in $DOTFILES_DIR/*/; do
    modulename=$module:t
    stow -d $DOTFILES_DIR -t $HOME --adopt -v $modulename
done

# Check if there is any git diff indicating a pre-existing file in $HOME and prompt overwrite
if git -C $DOTFILES_DIR status --porcelain=v1 2>/dev/null | grep -q "^ M"; then
    print
    print -P "%F{yellow}The following files already exist on the system:"
    modified_files=$(git -C $DOTFILES_DIR ls-files --modified)
    for file in modified_files; do
        print -P "\t%F{yellow}$file%f"
    done

    print
    if read -qs "choice?Overwrite existing files [y/N]? If n/N, the existing files will be kept and the git diff can be seen in $DOTFILES_DIR."; then
        print "\n"
        git -C $DOTFILES_DIR reset -q --hard
        print -P "%F{green}Files have been overwritten.%f"
    else
        print "\n"
        print -P "%F{yellow}Files have been left unchanged. Check git diff in $DOTFILES_DIR to see diff.%f"
    fi
fi

print -P "\n%F{green}Finished stowing dotfiles.%f"
