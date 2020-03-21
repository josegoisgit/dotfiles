export ZSH=$HOME/.oh-my-zsh
export ZSH_CUSTOM="$ZSH/custom";

plugins=(git tmux)

source $DOTZSH/antigen.zsh.symlink
ZSH_THEME="gallois";
antigen use oh-my-zsh
    #bundle
        antigen bundle git
        antigen bundle heroku
        antigen bundle pip
        antigen bundle lein
        antigen bundle command-not-found
        antigen bundle zsh-users/zsh-syntax-highlighting
    #theme
        antigen theme gallois
antigen apply
ZSH_THEME="gallois";

plugins(man tmux tmuxinator sudo screen python pip pipenv pep8 virtualenv npm docker docker-compose docker-machine git-auto-fetch git-escape-magic git-extras git-flow-avh git-flow git-hubflow git-prompt git-remote-branch git gitfast github gitignore)


