#!/bin/bash

echo "----------------------------------------------------------------------"
echo "Script Name : $0"
echo "Process PID : $$"
echo "RUN Time : $(date +%H):$(date +%M):$(date +%S)"
echo "----------------------------------------------------------------------"

function git_menu{
    PS3="Git Menu : "
    select GIT_MENU in 'commit' 'push' 'pull request' 'exit'
    do
        case $GIT_MENU in
        esac
    done
}

function main_menu{
    PS3="Category : "
    select CATEGORY_MENU in 'git' 'docker' 'exit'
    do
        case $CATEGORY_MENU in
            git)
            ;;
            docker)
            ;;
            eixt) exit 1 ;;
            *) ;;
        esac
    done
}