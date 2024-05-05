#!/bin/bash

function docker_menu {
    docker_cartegory=['container','image','volume','log','exit']
    for (( i =0; i < docker_cartegory.length; i++)); do
        $docker_cartegory[i]
    done
    PS3="docker cartegory : "
    select CATEGORY in 
    do
        case $CATEGORY in
        esac
    done

    function image_menu {
        image_stats=['create','rm','push','eixt']
        PS3="Image Stats Type : "
        select IMAGE_STATS in ${image_stats[@]}
        do
            case $IMAGE_STATS in
            esac
        done
    }

    function container_menu {
        container_stats=['create','rm','logs','eixt']
        PS3="Image Stats Type : "
        select CONTAINER_STATS in ${CONTAINER_STATS[@]}
        do
            case $CONTAINER_STATS in
            esac
        done
    }
}

function select_categories {
    PS3="Select one Category : "
    select CATEGORY in 'git' 'docker' 'exit'
    do
        case $CATEGORY in
            git)
                git_menu
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