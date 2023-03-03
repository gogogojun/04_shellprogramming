#!/bin/bash

echo -n "너의 선택은?(yes/no): "
read CHOICE

case $CHOICE in
    yes|y|YES|Y|Yes)  echo "[ok] oh yes~~~~~" ;;
    NO|n|no|N|No) echo "[FAIL] OH nooo~~~~~~~~" ;;
    *) echo "[FAIL] yes 또는 no를 입력해주세요" 
    exit 1 ;;
esac