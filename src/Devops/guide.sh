#!/bin/bash

# User Info
echo User Name : ${NAME}
echo Host Name : ${HOSTNAME}

# $0 : File Name, $$ : Shell Process in Number
echo File Name :  $0, $$ # ./guide.sh, 1826
echo File Useing Sec : ${SECONDS} sec

echo "------------------------------------------------"
# Path
echo File Directory : ${PWD} # PWD : Directory

# echo : String Text Default(1) Output
echo Test Script Output1 : echo
# printf : String Text Default(2) Output [\n = x]
printf Test Script Output2 : printf

# Boolean
if [ -e $filename ]; then
    echo File Exist
else
    echo File Not Exist
fi

# Array(Element)
Number_Arr=(1 2 3 4 5 6 7 8 9 10)
# Output
echo Element All Output : ${Number_Arr[@]} # 1 2 3 4 5 6 7 8 9 10
echo Element All Output : ${Number_Arr[*]} # 1 2 3 4 5 6 7 8 9 10
# 주의 : ${arr[Target value]}를 사용할 경우 Ubuntu와 Bash의 출력 차이가 생길 수 있다.
echo Element Target Output : ${Number_Arr[6]} # 7
echo Element Target Output : ${Number_Arr[*]:6} # 7 8 9 10
# Element Size
echo Element Size :  ${#Number_Arr[*]} # (1 ~ 10)10
# First Element added
Number_Arr+=1
echo Element All Output : ${Number_Arr[*]}