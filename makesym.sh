#!/bin/bash
###################
# makesim.sh
# create symlinks
###################

dir=~/dotfiles                  # dotfiles directory
backupdir=~/dotfiles_backup     # backup dotfiles directory

# list of files to symlink
files="vimrc bashrc"            

# create a backup directory for old dotfiles
echo -n "Creating $backupdir in home directory..."
mkdir -p $backupdir
echo "Done"

# move existing dotfiles in home to the backup directory
cd $dir || return
for file in $files; do
    echo "Moving $file from home to $backupdir..."
    mv ~/.$file $backupdir/
    echo "Creating symlink to $file in home directory..."
    ln -s $dir/$file ~/.$file
done

