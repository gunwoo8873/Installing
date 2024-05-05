#!/bin/bash

echo "----------------------------------------------------------------------"
echo "Script Name : $0"
echo "Process PID : $$"
echo "RUN Time : $(date +%H):$(date +%M):$(date +%S)"
echo "----------------------------------------------------------------------"

#echo 'Docker login'
#docker login

#echo "-------------------------------------------------------------------------"
#echo "0.1 Container List"
#docker container ls
#echo "========================================================================="
#docker container rm
#echo "0.2 Image List"
#docker image ls
#echo "========================================================================="
#echo "0.3 Volume List"
#docker volume ls
#echo "========================================================================="
#echo "0.4 Network List"
#docker network ls

#echo "-------------------------------------------------------------------------"
#echo "1.0 Image Build"   
#echo "Image Create Name :"
#read IMAGE_NAME
#echo "========================================================================="
#echo "1.1 Image Remove"
#docker "image rm $IMAGE_NAME"
#echo "========================================================================="
#echo "1.2 Image Create"
#docker "build -t $IMAGE_NAME ."
#echo "========================================================================="
#echo "1.3 Image Push"
#docker "push $IMAGE_NAME"

echo "----------------------------------------------------------------------"

function git_menu{
    PS3="Git Category : "
    select GIT_CATEGORY in 'commit' 'branch' 'pull_request' 'back'
    do
        case $GIT_CATEGORY in
        commit)
            echo "test"
        ;;
        branch)
            echo "test"
        ;;
        pull_request)
            echo "test"
        ;;
        back)
            select_categories
        ;;
        esac
    done
}

function docker_menu {
    Docker_Category=['container','image','volume']
    PS3="Docker Category : "
    select DOCKER_CATEGORY in 'info' 'container' 'image' 'volume' 'back'
    do
        case $DOCKER_CATEGORY in
            container)
                PS3="Container Option : "
                select CONTAINER_TYPE in 'create' 'run' 'remove' 'stop' 'start' 'info' 'back'
                do
                    case $CONTAINER_TYPE in
                        create|run)
                            read -p "Container Option : " CONTAINER_OPTION
                            read -p "Container Name : " CONTAINER_NAME
                            read -p "Volume Nmae : " CONTAINER_VOLUME
                            read -p "Base Image Name and Tag : " CONTAINER_IMAGE
                            docker build -t $CONTAINER_IMAGE .
                            docker $CONTAINER_TYPE $CONTAINER_OPTION --image $CONTAINER_IMAGE --name $CONTAINER_NAME -v $CONTAINER_VOLUME
                        ;;
                        remove|stop|start)
                            read -p ""
                        ;;
                        info)
                            PS3="Target for Information Category : "
                            select INFORMATION_CATEGORY in 'container' 'image' 'volume' 'back'
                            do
                                case $INFORMATION_CATEGORY in
                                back)
                                    select_categories
                                ;;
                                esac
                            done
                        ;;
                        back)
                            docker
                        ;;
                    esac
                done
            ;;
            image)
                echo "test"
            ;;
            volume)
                echo "test"
            ;;
            back)
                select_categories
            ;;
        esac
    done
}

function select_categories {
    PS3="Select one Category : "
    select CATEGORY in 'git' 'docker' 'exit'
    do
        case $CATEGORY in
            git)
                git
                ;;
            docker)
                docker_menu
                ;;
            exit)
                exit
                ;;
        esac
    done
}
select_categories
echo "----------------------------------------------------------------------"