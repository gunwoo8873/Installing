#!/bin/bash

function git_init {
    read -p "This Directory init for as Repository (y/n)? " INIT_SETUP
    if [[ $INIT_SETUP == [Y,y] ]]; then

        # -d  [Diretory] : Directory already Checking
        if [[ -d .git ]]; then
            echo "Repogitory for .git already"
            git_menu
        fi

        echo "Initializing Repository"
        git init

        read -p "Global User.name : " USER_NAME
        git config --global user.name "${USER_NAME}"
        read -p "Global User.email : " USER_EMAIL
        git config --global user.email "${USER_EMAIL}"

        git_menu

    elif [[ $INIT_SETUP == [N,n] ]]; then
        git_menu
    fi
}

function git_commit {
    PS3="Commit File Target Select : "
    select COMMIT_TARGET in 'ALL' 'INDIVIDUAL' 'REMOVE' 'BACK'
    do
        case $COMMIT_TARGET in
            ALL)
                1
            ;;
            INDIVIDUAL)
                2
            ;;
            REMOVE)
                3
            ;;
            BACK) git_menu ;;
            *)
        esac
    done
}

function git_setting {
    read -p "Github ID : " ENV_GITHUB_ID
    export env_gitub_id= "${ENV_GITHUB_ID}"
    read -p "Github Token : " ENV_GITHUB_TOKEN
    export env_gitub_token= "${ENV_GITHUB_TOKEN}"
}

function git_menu {
    clear
    PS3="Git Menu Select Menu : "
    select GIT_MENU in 'INIT' 'COMMIT' 'PULL' 'BRANCH' 'SETTING' 'EXIT'
    do
        case $GIT_MENU in
            INIT) git_init ;;
            COMMIT) git_commit ;;
            PULL) git_pull ;;
            BRANCH) git_branch ;;
            SETTING) git_setting ;;
            EXIT) exit 1 ;;
            *)
        esac
    done
}
git_menu