#!/bin/bash

TMP1=/tmp/tmp1
TMP2=/tmp/tmp2
TMP3=/tmp/tmp3
TMP4=/tmp/tmp4


# 1. PV
# 2. VG
# 3. LV

echo
echo "########################## PV 생성 #######################"
################################
# 1. PV
################################
# 1. PV
# (1) View
fdisk -l | grep LVM | awk '{print $1}' > $TMP1
pvs | tail -n +2 | awk '{print $1}' > $TMP2
diff $TMP1 $TMP2 | sort | uniq -u | tail -n +2 > dev/null 2>&1
while true
do
cat << EOF
############# PV VIEW ################
$(cat $TMP1 $TMP2 | sort | uniq -u)
######################################

EOF
# (2) Works
echo -n "위의 목록에서 pv로 생성하고 싶은 볼륨을 선택합니다."
echo -n "볼륨 선택? (ex: /dev/sdb1 /dev/sdc1 ...) : "
read VOLUME
echo -n "너 진짜 수행할거야? (yes|no|skip) : "
read CHOICE
case $CHOICE in 
        'yes') : ;;
        'no') continue ;;
        'skip') break ;;
        *) continue ;;
esac
break
done
pvcreate $VOLUME > /dev/null 2>&1

if [ $? -eq 0 ] ; then
    echo "[OK] Physical volume $VOLUME successfully created."
    pvs
else
    echo "[FAIL] Physical volume not created"
    exit 1
fi

echo
echo "########################## VG 생성 #######################"
################################
# 2. VG
################################
# 2. VG
# (1) View
vgs | tail -n +2 | awk '{print $1}' > $TMP3
pvs > $TMP4
for i in $(cat $TMP3)
do
    sed -i "/$i/d" $TMP4
done
cat << EOF
############# PV List ######################
$(cat $TMP4)
############################################

EOF
# (2) Works
# vgcreate vg1 /dev/sdb1 /dev/sdc1
echo -n "VG 이름은? (ex: vg1) : "
read VGNAME

echo -n "선택가능한 PV 목록을 적어 주세요? (ex: /dev/sdb1) : "
read PVLIST
vgcreate $VGNAME $PVLIST > /dev/null 2>&1
if [ $? -eq 0 ] ; then
    echo "[ OK ] Volume group $VGNAME successfully created"
    
    vgs
    
else
    echo "[ FAIL ] Volume group not created."
    exit 2
fi
echo
echo "########################## LV 생성 #######################"
################################
# 3. LV
################################
# 3. LV
# (1) View
cat << EOF
############# VG List ######################
$(vgs | awk '$7 != '0' {print $0}')
############################################
EOF
# (2) Works
# lvacreate vg1 -n lv1 -L 500m
echo -n "LV를 생성할 VG이름은? (ex: vg1) : "
read VGLV

echo -n "생성할 LV 이름은? (ex: lv1) : "
read LVNAME

echo -n "LV 용량은? (ex: 500m) : "
read LVSIZE
lvcreate $VGLV -n $LVNAME -L $LVSIZE
if [ $? -eq 0 ] ; then
    echo "[OK] Logical Volume $LVNAME succesfuly creaed"
   
    lvs
    
else
    echo "[FAIL] Logical Volume not created."
    exit 3
fi