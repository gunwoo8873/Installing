#!/bin/bash

################################################################
# Start developing Docker management commands (2024. 06. 08 ~ )
################################################################
# QnA
# 다른 외부 기능을 가져오고 싶은 경우는 Function.value 형식으로 작성한다? wjy?
################################################################

# Main File Set list and configuration
DOCKERFILE_PATH="../Dockerfile"
DOCKERIGNORE_PATH="../Dockerignore"
BASH_RUNFILE_PATH="./../Bash_run.sh"

# Docker Container Managerment
Container() {
    Create() {}
    Remove() {}
    Start() {}
    Stop() {}
    Pause() {}
    Restart() {}
    Exit() {}

    List() {
        echo "Current Docker Container list"
        docker container ls
        Container
    }
    
    Back() {
        Docker_Menulist
    }

    PS3=""
    opstions=("Create" "Remove" "Start" "Stop" "Pause" "Restart" "Exit" "List" "Back")
    select CONTAINER_MANAGERMENT in "${opstions[@]}"
    do
    done
}

Image() {
    Build() {
        # Docker Image Build Create to Setup
        echo "Image Build at Dockerfile to Create"
        read -p "Enter the image name and tag to build : " IMAGE_BUILD_NAME IMAGE_BUILD_TAG
        if [[ ${IMAGE_BUILD_NAME} =~ ^[a-zA-Z]$ && ${IMAGE_BUILD_TAG} =~ ^[a-zA-Z1-9.]$ ]]
        docker build -t ${IMAGE_BUILD_NAME}:${IMAGE_BUILD_TAG} .
    }

    Push() {}

    Merge() {}

    Remove() {
        Image.List
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
    opstions=("Create" "Remove" "Start" "Stop" "Pause" "Restart" "Exit" "List" "Back")
    select CONTAINER_MANAGERMENT in "${opstions[@]}"
    do
    done
}

# Docker Volume Managerment
Volume() {
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
Build() {
    echo "It's a function that's not currently being implemented"
}

# Docker Settings Managerment
Settings() {
    echo "It's a function that's not currently being implemented"
    Login() {
        docker login
    }
    Logout() {
        docker logout
    }

    PS3=""
    opstions=("Create" "Remove" "Start" "Stop" "Pause" "Restart" "Exit" "List" "Back")
    select CONTAINER_MANAGERMENT in "${opstions[@]}"
    do
    done
}

Back() {
    if [[ -x ${BASH_RUNFILE_PATH} ]]; then
        source ${BASH_RUNFILE_PATH}
    elif [[ ! -x ${BASH_RUNFILE_PATH} || ! -f ${BASH_RUNFILE_PATH} ]]
        echo error
    fi
}

# Docker Main Managerment
function Docker_Menulist() {
    PS3="Select the menu to run : "
    docker_menu=("Container" "Image" "Volume" "Build" "Settings" "Back")
    select DOCKER_MENU_SELECT in 
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