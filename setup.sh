#!/bin/bash

cd ~ 
wget https://raw.github.com/git/git/master/contrib/completion/git-completion.bash
wget https://raw.github.com/git/git/master/contrib/completion/git-prompt.sh

mv ~/git-completion.bash ~/.git.bash
mv ~/git-prompt.sh ~/.git.sh
