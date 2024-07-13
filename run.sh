#!/usr/bin/env bash

#### Target

#### env
trap '' SIGINT

#### Path
# readlink 라는 절대 경로를 고려해볼 만한가?
CURRENT_DIR="$(dirname "$0")"
DOCKER="$CURRENT_DIR/bin_sh/docker.sh"
GIT="$CURRENT_DIR/bin_sh/git.sh"
LOGIN="$CURRENT_DIR/bin_sh/login.sh"
REGISTER="$CURRENT_DIR/bin_sh/register.sh"

#### Note
Release_note() {
    echo "
    ============================================================================
    Shell script 기반으로 제작한 선택형 명령어 수행 프로세스 입니다.
    주의 : 현재 Git과 Docker 명령어 간편화는 테스트중이므로 오류가 발생할 수 있습니다.
    ============================================================================
    This is a selection-based command execution process created with Powershell Script.
    Note: The simplification of Git and Docker commands is currently being tested, so errors may occur.
    ============================================================================"
}

#### Login Session state
SESSION="LOGIN"


#### Menu
function menu() {
    cleat && Release_note
    option=("DOCKER" "GIT" "${SESSION}" "REGISTER")
    select SELECT_OPTION in "${option[@]}" do
        case $SELECT_OPTION in
            DOCKER)
            if [[ ${SESSION} == ${LOGIN_SESSION = true} ]]; then
                echo "로그인 해주세요"
            elif [[ ${SESSION} == ${LOGIN_SESSION = fals } ]]; then
                source $DOCKER
            fi
            ;;
            GIT);;
            "${SESSION}");;
            REGISTER);;
        esac
    done
}
