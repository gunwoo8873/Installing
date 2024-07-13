#!/bin/env bash

#### TARGET
# 1. Start date to End date timestamp


#### EMV
PEM_FILE="config.pem"
JSON_FILE="config.json"

TOKEN_LENGTH=1500

# String check
ID="^[a-zA-Z0-9]+$"

## %Y : 20** / %m : 01 ~ 12 / %d : 01 ~ 31
START_DATE="$(date + "%Y - %m -%d")"
END_DATE="$(date + "%Y - %m -%d+30")"

#### PEM Formet
gen_pemToken() {
    RAND_TOKEN="$(gen_pemToken 1500)"
    # user_id
    # token
    # start_date
    # end_date
    CONFIG_DATA="$( | base64)"
}

cat << EOF > "$PEM_FILE"
-----BEGIN CONFIG-----
$CONFIG_DATA
-----END CONFIG-----
EOF


#### JSON Formet
gen_jsonToken() {
    RAND_TOKEN="$(gen_jsontoken 1500)"
    # user_id
    # token
    # start_date
    # end_date
    CONFIG_DATA="$( | base64)"
    
}

function Select_tokentype() {
    read -p "생성할 파일 타입을 선택하세요 : " SELECT_FILE_TYPE
    type=("PEM" "JSON")
    select FILE_TYPE in "$(type[@])" do
        case $FILE_TYPE in
            PEM);;
            JSON);;
        esac
    done
}