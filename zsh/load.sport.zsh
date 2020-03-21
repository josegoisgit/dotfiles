export SPORT_HOME=$HOME/Dropbox/SPORT

export SPORT_FOLDER=$SPORT_HOME
export SPORT_CURRENT=$SPORT_HOME

function sport_find(){
    declare -i COUNT=0;
    for sport in $(find $SPORT_FOLDER -mindepth 1 -maxdepth 1 -type d | sort)
    do
        COUNT=COUNT+1;
        if [[ $sport == $SPORT_CURRENT ]]; then
            return COUNT;
        fi
    done;
    return -1;
}

function sport_shift(){
    # Thu 27 Feb 2020 02:20:03 AM -03
    # -> NEED TO IMPLEMENT CIRCULAR SHIFT
    declare -i NOF_URI
    NOF_URI=$(find $SPORT_FOLDER -mindepth 1 -maxdepth 1 -type d | wc -l)
    COUNT=0
    SHIFT=$1
    SHIFT=${SHIFT:-COUNT}
    SHIFT=$((SHIFT % NOF_URI))
    sport_find
    CURRENT=$((?))
    for sport in $(find $SPORT_FOLDER -mindepth 1 -maxdepth 1 -type d | sort)
    do
        COUNT=$((COUNT+1))
        if [ "$CURRENT" -gt "0" ]; then
            if [ $(( CURRENT + SHIFT )) -eq $(( COUNT )) ]; then;
                SPORT_CURRENT=$sport;
                break;
            fi
        else
            if [ $SHIFT -gt 0 ]; then
                if [ $(( SHIFT )) -eq $(( COUNT )) ]; then;
                    SPORT_CURRENT=$sport;
                    break;
                fi
            else
                if [ $(( NOF_URI + SHIFT )) -eq $(( COUNT )) ]; then;
                    SPORT_CURRENT=$sport;
                    break;
                fi
            fi
        fi
    done
}

function sport_load(){
    tmux send-keys -t 1 Escape ":qa" Enter;
    tmux send-keys -t 1 "cd $SPORT_CURRENT" Enter;
    tmux send-keys -t 1 "vim $SPORT_CURRENT/input" Enter;
    
    tmux send-keys -t 0 Escape ":qa" Enter;
    tmux send-keys -t 0 "cd $SPORT_CURRENT" Enter;
    tmux send-keys -t 0 "vim $SPORT_CURRENT/main.cpp" Enter;

    tmux send-keys -t 2 C-C "cd $SPORT_CURRENT" Enter;
    tmux send-keys -t 2 "clear" Enter;
}


function sport_prev(){
    sport_shift -1
    sport_load
}

function sport_next(){
    sport_shift 1
    sport_load
}

function sport(){
    local RESOURCE=$1;
    if [ -z $RESOURCE ] || [ -d $SPORT_HOME/$RESOURCE ]
    then
        $RESOURCE="VJUDGE"
        echo $RESOURCE
    fi

    SPORT_FOLDER=$SPORT_HOME/$RESOURCE
    SPORT_CURRENT=$SPORT_FOLDER
    cd $SPORT_CURRENT
    tmux kill-session -t $RESOURCE
    tmuxinator start sport $1
}

function sport_run(){
    g++ $SPORT_CURRENT/main.cpp -o $SPORT_CURRENT/main
    time $SPORT_CURRENT/main < $SPORT_CURRENT/input.std > $SPORT_CURRENT/output.out
    vimdiff $SPORT_CURRENT/output.std $SPORT_CURRENT/output.out
}

function sport_backup(){
    declare -i nof_input = (find $SPORT_CURRENT -iname "input*.in" | wc -l);
    cp $SPORT_CURRENT/input.in $SPORT_CURRENT/input.$nof_input.in
}

function codef_scrap(){
    CODEF_BASE="https://codeforces.com/problemset"
    CODEF_BASE="https://codeforces.com/problemsets/acmsguru"
}


