alias reload!='. ~/.zshrc'

alias vs="v `git status --porcelain | sed -ne 's/^ M //p'`"
alias v="vim -p"
alias cd="c"
alias vrc='vim $DOTPATH/vim/vimrc.vim'
alias yoda01_jupyter="sudo docker run -it -p 8443:8888 -v /home/zetdg/data:/home/jovyan -v /home/zetdg/notebook:/home/jovyan/notebook -v /mnt/nfs/dados_nas/proc:/home/jovyan/proc -v /mnt/nfs/dados_nas/raw:/home/jovyan/raw -v /mnt/nfs/dados_nas/digest:/home/jovyan/digest -v /mnt/nfs/dados_nas/report:/home/jovyan/report -e NB_UID=1000 -e NB_GID=100 -e GRANT_SUDO=yes jupyter/datascience-notebook start-notebook.sh --NotebookApp.token=''"
alias vdoc='cd ~/doutorado && vtex ~/doutorado/main.tex'
alias ssh_yoda1="ssh -X -L 8888:yoda01.neuro.ufrn.br:8443 zetdg@yoda01.neuro.ufrn.br -p2222 -t 'tmux a -t Generic || tmux new -s Generic'"
alias ssh_yoda="ssh -X -L 8888:177.20.140.1:8443 zetdg@177.20.140.1 -p2222 -t 'tmux a -t Generic || tmux new -s Generic'"
alias cls='clear' # Good 'ol Clear Screen command

