#!/bin/bash

echo User Name : ${LOGNAME}
echo Host Name : ${HOSTNAME}

echo File Name :  $0, $$
echo File Useing Sec : ${SECONDS} sec

A=90
B=70
# -ge : a > b
if [ ${A} -ge ${B} ]; then
    echo "A > B : false"
fi