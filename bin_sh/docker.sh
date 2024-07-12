#!/bin/env bash

#### 환경 변수
CURRENT_DIR="$(dirname "$0")" # 현재 디렉토리 정보
DIR_BACK="$CURRENT_DIR/../../Bash_run.sh"

trap '' SIGINT # Terminal 강제 종료 비활성화

#### 문자열 체크
YES="^[yY]$"
NO="^[nN]$"
OPTION="^[a-z]$"

# ID와 PW 정규식
INPUT_USER_NAME="^[a-zA-Z0-9]+$"
INPUT_USER_PASSWORD="^[a-zA-Z0-9*!%]$"

#### 일부 입력값 저장
INPUT="$1"
OUTPUT="$2"

BASE_CONTAINER="$11"
NEW_CONTAINER="$21"

#### 종료
Exit() {
    # -n : 입력키 활당 + 1 : 한글자 허용
    # -s : 입력값에 대한 출력을 비공개
    # -r : 읽을수 있는지 여부
    # -p : 들여쓰기 없이 한라인에 사용
    read -n 1 -s -r -p "아무키를 눌러 종료하세요..." && exit 1
}

#### 뒤로가기

#### 컨테이너
function Container() {
    Type() {
        Create() {}
        Remove() {}
        Rename() {
            # docker container rename [base_container] [new_container]
            docker rm ${BASE_CONTAINER} ${NEW_CONTAINER}
        }
    }
    Status() {
        Start() {}
        Stop() {}
        Restart() {}
        Pause() {}
    }
    Log() {}
}

#### 이미지
function Image() {}

#### 불륨
function Volume() {}

#### 로그인 세션
function Login() {
    # 주의 : while가 아닌 단순 if문으로 작성시 성능 오버헤드와 무한 루프백 발생
    while true; do
        # -z : 문자열이 공백 여부 확인(NN)
        if [[ -z "$INPUT" ]]; then
            read -p "도커 로그인 하시겠습니까? (Y/N) : " INPUT
        fi
        if [[ ${INPUT} =~ ${YES} ]]; then    
            #### Docker login option
            # [-p] or [--password] / [--password-stdin]
            # [-n] or [--username]
            echo "로그인 시도중..."
            break
        elif [[ ${INPUT} =~ ${NO} ]]; then
            Exit
        else
            echo "올바른 입력이 아닙니다. 다시 입력 해주세요."
            INPUT=""
        fi
    done
}

#### 메뉴
function Menu() {
    clear
    PS3="도커 메뉴를 선택하세요 : "
    option=("컨테이너" "이미지" "불륨" "빌드" "세팅" "나가기")
    select MENU_SELECT in "${option[@]}"
    do
        case ${MENU_SELECT} in
            컨테이너) Container ;;
            이미지) Image ;;
            불륨) Volume ;;
            빌드);;
            세팅);;
            나가기) Exit ;;
            *) Menu ;;
        esac
    done
}
Menu