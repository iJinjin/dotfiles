#!/bin/bash
###################
# makesim.sh
# create symlinks
###################

DIR=~/dotfiles                  # dotfiles directory
DIR_BACKUP=~/dotfiles_backup     # backup dotfiles directory

# list of files to symlink
files="vimrc 
       bashrc 
       bash_aliases
       zshrc"            

# create a backup directory for old dotfiles if not present
if [ ! -d "$DIR_BACKUP" ]; then
    echo -n "Creating $DIR_BACKUP in home directory... "
    mkdir -p $DIR_BACKUP
    echo "Done"
fi

# move existing dotfiles in home to the backup directory
cd $DIR || return
for file in $files; do
    echo -n "Moving $file from home to $DIR_BACKUP... "
    mv "$HOME/.$file" "$DIR_BACKUP/"
    echo "Done"
    echo -n "Creating symlink to $file in home directory... "
    ln -s "$DIR/$file" "$HOME/.$file"
    echo "Done"
done

