#!/bin/bash

function git_menu {
    PS3="Git Repo Menu : "
    select REPOSITORY_MENU in 'commit' 'pull' 'branch' 'status' 'exit'
    do
        case $REPOSITORY_MENU in
            commit)
                PS3="Commit is Target : "
                select ADD_TARGET in 'all' 'each' 'back'
                do
                    case $ADD_TARGET in
                        all)
                            read -p "Commit Message : " COMMIT_MESSAGE
                            git add * && git commit -m "${COMMIT_MESSAGE}"
                            break 1
                        ;;
                        each)
                            read -p "ADD Target File : " FILE_TARGET
                            read -p "Commit Message : " COMMIT_MESSAGE
                            git add ${FILE_TARGET} && commit -m ${COMMIT_MESSAGE}
                        ;;
                        back) break 1 ;;
                    esac
                done
            ;;
            pull)
                echo "pull"
            ;;
            branch)
                echo "branch"
            ;;
            status)
                echo "status"
            ;;
            exit) exit 0 ;;
        esac
    done
}
git_menu