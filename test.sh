#!/bin/bash

echo "-------------------"
git --version
echo "-------------------"
git log -p -2
echo "-------------------"

function git_menu {
    git branch -l
    PS3="Git Repo Menu : "
    select REPOSITORY_MENU in 'COMMIT' 'PULL_NULL' 'BRANCH' 'STATUS_NULL' 'EXIT'
    do
        case $REPOSITORY_MENU in
            COMMIT)
                PS3="Commit File Target : "
                select ADD_TARGET in 'ALL' 'INDIVIDUAL' 'REMOVE' 'BACK'
                do
                    if [[ $ADD_TARGET == 'ALL' ]]; then
                        clear
                        echo "---------------------------"
                        git status
                        echo "---------------------------"
                        read -p "Commit Message : " COMMIT_MESSAGE
                        git add * && git commit -m "${COMMIT_MESSAGE}"
                        git push
                        git_menu

                    elif [[ $ADD_TARGET == 'INDIVIDUAL' ]]; then
                        clear
                        echo "---------------------------"
                        git status
                        echo "---------------------------"
                        read -p "ADD Target File : " FILE_TARGET
                        read -p "Commit Message : " COMMIT_MESSAGE
                        git add "${FILE_TARGET}" && git commit -m "${COMMIT_MESSAGE}"
                        git push
                        git_menu

                    elif [[ $ADD_TARGET == 'REMOVE' ]]; then
                        clear
                        PS3="Remove File Repo Type : "
                        select TYPE_TARGET in 'LOCAL' 'ORIGIN' 'BACK'
                        do
                            if [[ $TYPE_TARGET == 'LOCAL' ]]; then
                                echo "WARNING : Local Directory File Remove"
                                read -p "Remove Target File : " FILE_TARGET
                                git rm "${FILE_TARGET}"

                            elif [[ $TYPE_TARGET == 'ORIGIN' ]]; then
                                read -p "Remove Target File : " FILE_TARGET
                                git rm --cached -r "${FILE_TARGET}"
                            
                            elif [[ $TYPE_TARGET == 'BACK' ]]; then
                                break 1
                            fi
                        done
                    elif [[ $ADD_TARGET == 'BACK' ]]; then
                        git_menu
                    fi
                done
            ;;

            PULL_NULL)
                echo "pull"
            ;;

            BRANCH)
                PS3="Branch : "
                select BRANCH_MENU in 'CREATE' 'SWITCH' 'REMOVE' 'BACK'
                do
                    if [[ $BRANCH_MENU == 'CREATE' ]]; then
                        clear
                        read -p "Branch Create Name : " BRANCH_NAME
                        git checkout -b "${BRANCH_NAME}"
                        git_menu

                    elif [[ $BRANCH_MENU == 'SWITCH' ]]; then
                        clear
                        git branch -l
                        read -p "Switch Branch Name : " BRANCH_NAME
                        git checkout "${BRANCH_NAME}"
                        git_menu

                    elif [[ $BRANCH_MENU == 'REMOVE' ]]; then
                        clear
                        read -p "Remove Branch Name : " BRANCH_NAME
                        git branch -D "${BRANCH_NAME}"
                        git_menu
                    
                    elif [[ $BRANCH_MENU == 'BACK' ]]; then
                        git_menu
                    fi
                done
            ;;

            STATUS_NULL)
                echo "status"
            ;;

            EXIT) exit 0 ;;

            *) ;;
        esac
    done
}
git_menu