#!/bin/bash

function test_init() {
    read -p "Repository Initialization for Directory?(Y/N) : " GIT_SETUPREPO
    if [[ $GIT_SETUPREPO == [Y,y] ]]; then
        if [[ -d .git ]]; then
            echo "'Repository is already'"
            if [[ -d config.json ]]; then
                echo "config.json Git User Setting plase"
            fi
        elif [[ ! -d .git ]]; then
            echo "Creating new Repository"
            git init

        fi
    elif [[ $GIT_SETUPREPO == [N,n] ]]; then
    fi
}

function test_commit() {
    
}

function test_menu() {
    echo "==========================="
    echo "Git Command Menu is for Test"
    git --version
    echo "==========================="
    PS3="Git Menu Select One : "
    select GIT_MENULIST in 'INIT' 'COMMIT' 'PULL' 'BRANCH' 'SETTINGS' 'EXIT'
    do
        if [[ $GIT_MENULIST == 'INIT' ]]; then
            test_init
        elif [[ $GIT_MENULIST == 'COMMIT' ]]; then
            test_commit
        elif [[ $GIT_MENULIST == 'PULL' ]]; then
        elif [[ $GIT_MENULIST == 'BRANCH' ]]; then
        elif [[ $GIT_MENULIST == 'SETTINGS' ]]; then
        elif [[ $GIT_MENULIST == 'EXIT' ]]; then
        fi
    done
}