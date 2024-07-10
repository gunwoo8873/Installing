#!/bin/env bash

# Main File Set list and configuration
# SCRIPT_PATH=$(dirname "$0")
# BASH_RUNFILE_PATH="$SCRIPT_PATH/../Bash_run.sh"

# Repository Setup
function Settings() {
    Initialize() {
        Init_Setup() {
            # ^[] : Indicates the beginning of a string. / 문자열의 시작을 의미한다
            # []$ : means the end of the string / 문자열의 끝을 의미한다
            local NAME_CHECK="^[a-zA-Z0-9]$"
            local EMAIL_CHECK="^[a-zA-Z0-9._]+@[a-z]+\.[a-z]{2,}$"
            local ERROR_CHECK="^[!#$%&'*+-/=?^_{|}~]$"

            Init_userName() {
                # -p : 
                read -p "Enter the username : " GET_USERNAME
                # =~ : regular expression / 정규표현식
                if [[ ${GET_USERNAME} =~ ${NAME_CHECK} ]]; then
                    git config --global user.name ${GET_USERNAME}
                elif [[ ${GET_USERNAME} =~ ${ERROR_CHECK} ]]; then
                    echo "Invalid user name format. Please try again."
                    Init_userName
                fi
            }

            Init_userEmail() {
                read -p "Enter the user email : " GET_USEREMAIL
                if [[ ${GET_USEREMAIL} =~ ${EMAIL_CHECK} ]]; then
                    git config --global user.email ${GET_USER_EMAIL}
                elif [[ ${GET_USEREMAIL} =~ ${ERROR_CHECK} ]]; then
                    echo "Invalid user email format. Please try again."
                    Init_userEmail
                fi
            }
            
            read -p "Do you want to initialize the Repository? (y/n): " GET_INIT_SELECT
            if [[ ${GET_INIT_SELECT} == [yY] ]]; then
                if [[ -d ${GIT_DIR} ]]; then
                    Init_userName && Init_userEmail
                    git config --global -l
                else
                    git init
                    Init_userName && Init_userEmail
                fi
            elif [[ ${GET_INIT_SELECT} == [nN] ]]; then
                echo "This repository is already initialized."
            fi
            Settings
        }
        Init_Setup
    }

    Clone() {
        URL() {
            read -p "Enter the GitHub repository address to clone : " CLONE_REPO_URL
            echo "Clone the GitHub repository"
            git clone ${CLONE_REPO_URL}
            echo "Cloning of the repository is complete"
            Clone
        }

        # TODO(@gunwoo8873) : Github의 SSH 토큰 발급 및 관리 방법 모색
        SSH() {
            echo "It's a function that's not currently being implemented"
        }

        CLI() {
            echo "It's a function that's not currently being implemented"
        }

        PS3="Select the type of repository you want to copy : "
        options=("URL" "SSH" "CLI" "Back")
        select SETUP_COMMAND in "${options[@]}"
        do
            case $SETUP_COMMAND in
                "URL") URL ;;
                "SSH") SSH ;;
                "CLI") CLI ;;
                "Back") Settings ;;
            esac
        done
    }

    Pull() {
        echo "GitHub repository pull"
        git pull
        Settings
    }

    Reset() {
        # Warings : Note that the initializes additional and committed files and returns all of the work.
        # 경고 : 추가 및 커밋된 파일을 초기화하고 모든 작업을 반환합니다.
        Hard() {
            echo "Repository to HRAD reset"
            echo Warings : Note that the initializes additional and committed files and returns all of the work.""
            echo "경고 : 추가 및 커밋된 파일을 초기화하고 모든 작업을 반환합니다."
            #git reset --hard
        }

        # Soft : Note that the initializes additional and committed files and returns of the work
        #
        Soft() {
            echo "Repository to SOFT reset"
            #git reset --soft HAED~1
        }

        # Mixed : 
        Mixed() {
            echo "Repository to MIXED reset"
            #git reset --mixed
        }

        PS3=""
        options=("HARD" "SOFT" "MIXED" "Back")
        select RESET_COMMAND in "${options[@]}"
        do
            case $RESET_COMMAND in
                HARD) Hard ;;
                SOFT) Soft ;;
                MIXED) Mixed ;;
                Back) Settings ;;
                *) echo "Invalid option. Please try again." ;;
            esac
        done
    }

    PS3="Select the repository management type : "
    options=("Initialize" "Clone" "Pull" "Reset" "Back")
    select SETUP_COMMAND in "${options[@]}"
    do
        case $SETUP_COMMAND in
        "Initialize") Initialize ;;
        "Clone") Clone ;;
        "Pull") Pull ;;
        "Reset") Reset ;;
        "Back") Menulist ;;
        *) echo "Invalid option. Please try again." ;;
        esac
    done
}

# Command to Commit and Repository Pull (2024. 05. 20 ~ **)
function Commit() {
    Add_Commit() {
        All() {
            git status
            read -p "Please enter a message to commit: " COMMIT_MESSAGE
            echo "GitHub All add and Commit"
            git add * && git commit -m "${COMMIT_MESSAGE}" && Push
        }

        Individual() {
            git status
            read -p "Please enter the file you want to add: " ADD_FILE
            read -p "Please enter a message to commit: " COMMIT_MESSAGE
            git add "${ADD_FILE}" && git commit -m "${COMMIT_MESSAGE}" && Push
        }

        PS3="Please enter the scope of the file to commit : "
        options=("All" "Individual" "Back")
        select COMMAND_SELECT in "${options[@]}"
        do
            case $COMMAND_SELECT in
                All) All ;;
                Individual) Individual ;;
                Back) Commit ;;
                *) echo "Invalid option. Please try again." ;;
            esac
        done
    }

    Push() {
        echo "Git Add and Commit to Repository Push"
        git push
        Commit
    }

    # 현재 기능 구현 X
    Remove() {
        echo "Current committed repository logs"
        git log -2
        echo "Git Remove Command (to be implemented)"
        Commit
    }

    Merge() {
        read -p "Enter the branch you want to commit. : " MERGE_MAIN_BRANCH
        git checkout $MERGE_MAIN_BRANCH
        read -p "Enter Branch to merge : " MERGE_MAIN_BRANCH
        git merge $MERGE_TARGET_BRANCH
        Commit
    }

    PS3="Please select a commit option : "
    options=("Add_Commit" "Push" "Merge" "Back")
    select COMMAND_SELECT in "${options[@]}"
    do
        case $COMMAND_SELECT in
            "Add_Commit") Add_Commit ;;
            "Push") Push ;;
            "Merge") Merge ;;
            "Back") Menulist ;;
            *) echo "Invalid option. Please try again." ;;
        esac
    done
}

function Branch() {
    local BRANCH_NAME_CHECK="^[a-zA-Z0-9]$"

    Current() {
        echo "Current(verbose) Branch list"
        git branch -v || git branch --verbose
    }
    
    Create() {
        Current
        read -p "Enter the create branch name : " CREATE_BRANCH
        if [[ ${CREATE_BRANCH} =~ ${BRANCH_NAME_CHECK} ]]; then
            git branch ${CREATE_BRANCH}
        else
            echo "Invalid branch name"
            Create
        fi
        Branch
    }

    Remove() {
        Current
        read -p "Enter the remove branch name : " REMOVE_BRANCH
        if [[ ${REMOVE_BRANCH} =~ ${BRANCH_NAME_CHECK} ]]; then
            git branch -D ${REMOVE_BRANCH}
        else
            echo "Invalid branch name"
            Remove
        fi
        Branch
    }

    Checkout() {
        Current
        read -p "Enter the checkout branch name : " CHECKOUT_BRANCH
        if [[ ${CHECKOUT_BRANCH} =~ ${BRANCH_NAME_CHECK} ]]; then
            git checkout -b ${CHECKOUT_BRANCH}
        else
            echo "Invalid branch name"
            Checkout
        fi
        Branch
    }

    Info() {
        read -p "Enter the branch name: " BRANCH_NAME
        git branch -v | grep "${BRANCH_NAME}"
    }

    PS3="Select a branch management option : "
    options=("Create" "Remove" "Checkout" "Info" "Back")
    select COMMAND_SELECT in "${options[@]}"
    do
        case $COMMAND_SELECT in
            "Create") Create ;;
            "Remove") Remove ;;
            "Checkout") Checkout ;;
            "Info") Info ;;
            "Back") Menulist ;;
            *) echo "Invalid option. Please try again." ;;
        esac
    done
}

function History() {
    Graph() {
        echo "It's a function that's not currently being implemented"
        git log --graph
        History
    }

    Log() {
        echo "It's a function that's not currently being implemented"
        read -p "Enter the Looking for Git logs at scope : "
        git log -p ${SCOPE_NUMBER}
        History
    }

    PS3="Enter the History menu : "
    options=("Graph" "Log" "Back")
    select COMMAND_SELECT in "${options[@]}"
    do
        case $COMMAND_SELECT in
            Graph) Graph ;;
            Log) Log ;;
            Back) Menulist ;;
            *) echo "Invalid option. Please try again." ;;
        esac
    done
}

function Back() {
    # $0 : Current Directory
    SCRIPT_DIR=$(dirname "$0")
    BASH_RUNFILE_PATH="$SCRIPT_DIR/../Bash_run.sh"

    # Bash_run.sh 파일 존재 여부 확인 후 실행
    if [[ -f "$BASH_RUNFILE_PATH" ]]; then
        source "$BASH_RUNFILE_PATH"
    else
        echo "Error: Bash_run.sh not found at $BASH_RUNFILE_PATH"
        exit 1
    fi
}

# Bash Run to get Menu list
function Menulist() {
    PS3="Git Command to Select One: "
    options=("Settings" "Commit" "Branch" "History" "Back")
    select COMMAND_SELECT in "${options[@]}"
    do
        case "$COMMAND_SELECT" in
            "Settings") Settings ;;
            "Commit") Commit ;;
            "Branch") Branch ;;
            "History") History ;;
            "Back") Back ;;
            *) echo "Invalid option. Please try again." ;;
        esac
    done
}
Menulist