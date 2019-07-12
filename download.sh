#!/usr/bin/env bash

export DOWNLOAD_DIR='/media/eugene/big-one/datasets/open-images-dataset'

mkdir -p ${DOWNLOAD_DIR}
cd ${DOWNLOAD_DIR}

declare -a arr=(
"0" "1" "2" "3" "4" "5" "6" "7" "8" "9"
"a" "b" "c" "d" "e" "f"
)

for i in "${arr[@]}"
do
    echo "start to download ${i} file"
    n=0
    until [ ${n} -ge 5 ]
    do
        time aws s3 --no-sign-request cp s3://open-images-dataset/tar/train_${i}.tar.gz . && break
        echo "retry one more time ${n}/5"
        n=$[$n+1]
        sleep 5
    done
done
