#!/usr/bin/bash
function BASH_RUNNOTIE {
    echo "==================================================================="
    echo "Shell Scripting Command Automation for Git Command Skip Target"
    echo "1. TerMinal Bash is Version 2.25.*"
    echo "2. This Script the Beta 1.0.0 is New Shell Scripting git Command"
    echo "==================================================================="
    GIT_MENU
}
BASH_RUNNOTIE

function GIT_COMMIT {
}

function GIT_STATUS {
}

function GIT_PULL {
}

function GIT_MENU {
    PS3="Git Command Menu Select one : "
    select GIT_COMMANDMENU in 'INIT' 'COMMIT' 'PULL' 'LOG' 'SETTTING' 'EXIT'
    do
        if [[ ${GIT_COMMANDMENU} == 'INIT' ]]; then
        elif [[ ${GIT_COMMANDMENU} == 'COMMIT' ]]; then
        elif [[ ${GIT_COMMANDMENU} == 'PULL' ]]; then
        elif [[ ${GIT_COMMANDMENU} == 'LOG' ]]; then
        elif [[ ${GIT_COMMANDMENU} == 'SETTING' ]]; then
        elif [[ ${GIT_COMMANDMENU} == 'EXIT']]; then
        elif [[ ${GIT_COMMANDMENU} != * ]]; then
        fi
    done
}