#!/bin/env bash

######
# Main File Set list and configuration
SCRIPT_PATH=$(dirname "$0")
BASH_RUNFILE_PATH="$SCRIPT_PATH/../Bash_run.sh"
DOCKERFILE_PATH="$SCRIPT_PATH/../Dockerfile"
DOCKERIGNORE_PATH="$SCRIPT_PATH/../Dockerignore"

CONTIANER_NAME_CHECK="^[a-zA-Z/-_]$"
OPTION_CHECK="^[a-z]$"
IMAGE_NAME_CHECK="^[a-zA-Z0-9.]"

# Container Managerment
function Container() {
    Managerment() {
        Create() {
            read -p "Enter the container option : " CONTAINER_OPTION
            read -p "Enter a container that uses the default image name. : " CONTAINER_BASE_IMAGE
            if [[ $CONTAINER_OPTION =~ ${OPTION_CHECK} && $CONTAINER_BASE_IMAGE =~ ${IMAGE_NAME_CHECK} ]]; then
                docker container create --name $CONTAINER_OPTION $CONTAINER_BASE_IMAG
            else
                echo "Invalid option"
                Create
            fi
        }
        
        Remove() {
            # command : docker container rm -f [CONTAINER_NAME]
            docker container rm -f "$CONTAINER_NAME"
        }
    }

    Status(){
        Start() {
        # command : docker container rm -f or all [CONTAINER_NAME]
        docker container start -f "$CONTAINER_NAME"
        }

        Stop() {
            # command : docker container stop -f or all [CONTAINER_NAME]
            docker container stop "$CONTAINER_NAME"
        }

        Pause() {
            # command : docker container pause -f or all [CONTAINER_NAME]
            docker container pause "$CONTAINER_NAME"
        }

        Restart() {
            # command : docker container restart -f or all [CONTAINER_NAME]
            docker container restart "$CONTAINER_NAME"
        }
        
        Kill() {
            read -p 
            # command : docker container kill -f or all [CONTAINER_NAME]
            docker container kill "$CONTAINER_NAME"
        }

        read -p "Select the Container Status Menu : "
        STATUS_OPTIONS=("Start" "Stop" "Pause" "Restart" "Kill" "Back")
        select STATUS_SELECT in "${STATUS_OPTIONS[@]}"
    }

    List() {
        echo "Current Docker Container list"
        docker container ls
        Container
    }

    PS3="Select Container run menu : "
    CONTAINER_TYPE=("Managerment" "Status Type" "List" "Back")
    select CONTAINER_MANAGERMENT in "${CONTAINER_TYPE[@]}"
    do
        case $CONTAINER_MANAGERMENT in
            Managerment) Managerment ;;
            Status) Status ;;
            Back) Back ;;
            *) $! ;;
        esac
    done
}

function Image() {
    Build() {
        echo "Image Build at Dockerfile to Create"
        read -p "Enter the image name and tag to build : " IMAGE_BUILD_NAME IMAGE_BUILD_TAG
        if [[ ${IMAGE_BUILD_NAME} =~ ^[a-zA-Z-_/]$ && ${IMAGE_BUILD_TAG} =~ ^[a-zA-Z1-9.]$ ]]; then
            docker build -t ${IMAGE_BUILD_NAME}:${IMAGE_BUILD_TAG} .
        else
            echo $!
        fi
    }

    Push() {
        # command : docker image push [OPTIONS] name[:IMAGE_TAG]
    }

    Save() {
        read -p "Enter thr image name : " IMAGE_NAME
        # command : docker image save [OPTIONS] name[:IMAGE_TAG]
        # command(Sort) : docker save
        docker save myimage:latest | gzip > myimage_latest.tar.gz
    }

    Remove() {
        Image.List
        # command : docker image rm -f [IMAGE_NAME]:[IMAGE_TAG]
    }

    List() {
        echo "Docker Image list"
        docker image ls
    }

    DockerHub_Push() {
        Image.List
        echo "경고: 푸시할 이미지가 도커 허브 리포지토리 이름과 같아야 합니다"
        echo "Warning: The image you want to push must have the same name as your Docker Hub repository"
        read -p "Enter the image name and tag to" REPOSITORY_NAME REPOSITORY_TAG
        if [[ ${REPOSITORY_NAME} =~ ^[a-zA-Z/]$ && ${REPOSITORY_TAG} =~ ^[a-zA-Z1-9.]$ ]]
            docker push ${REPOSITORY_NAME}:${REPOSITORY_TAG}
            echo "DockerHub Image Push"
            Image
        else
            echo "Error: The image you want to push must have the same name as"
            Image
        fi
    }

    PS3=""
    opstions=("Build" "Push" "Save" "Remove" "List" "Docker Hub" "Back")
    select CONTAINER_MANAGERMENT in "${opstions[@]}"
    do
    done
}

# Docker Volume Managerment
function Volume() {
    Create() {}
    Remove() {}
    Mount() {}
    Unmount() {}

    PS3=""
    opstions=("Create" "Remove" "Start" "Stop" "Pause" "Restart" "Exit" "List" "Back")
    select CONTAINER_MANAGERMENT in "${opstions[@]}"
    do
    done
}

# Docker Build Managerment
function Build() {
    echo "It's a function that's not currently being implemented"
}

# Docker Settings Managerment
function Settings() {
    echo "It's a function that's not currently being implemented"
    Login() {
        docker login
    }
    Logout() {
        docker logout
    }
    Export() {

    }

    PS3=""
    opstions=( "Back")
    select CONTAINER_MANAGERMENT in "${opstions[@]}"
    do
    done
}

function Menulist() {
    PS3="Select the menu to run : "
    MENULIST=("Container" "Image" "Volume" "Build" "Settings" "Back")
    select MENU_SELECT in "${MENULIST[@]}"
    do
        Container) Container ;;
        Image) Image ;;
        Volume) Volume ;;
        Build) Build ;;
        Settings) Settings ;;
        Back) Back ;;
        *) echo "Invalid Input" ;;
    done
}