#!/bin/bash

set -e
set -x

crop_s() {
    fn=$1
    convert ${fn}.png -crop 792x1028+693+214 ${fn}_main.png
}

crop_c() {
    fn=$1
    convert ${fn}.png -crop 992x852+592+214 ${fn}_main.png
}

crop_w() {
    fn=$1
    convert ${fn}.png -crop 1176x852+504+214 ${fn}_main.png
}

scale() {
    fn=$1
    width=$2
    convert -resize $width ${fn}.png ${fn}.jpg
}

crop_and_scale() {
    fn=$1
    width=$2
    suffix=$3
    crop_${suffix} ${fn}
    scale ${fn}_main ${width}
}



#for f in base gra_j5 gra_wes gra_hid coord_jp coord_num; do
#    crop_and_scale $f 200
#done


#for f in en jp; do
#    for g in en jp; do
#        scale lang_${f}_${g} 600
#    done
#done

#for f in large small; do
#    scale sz_${f} 300
#done

#scale double 300
#scale double_mobile 300
#scale annotated 600
#crop_and_scale rgb 200 s
#crop_and_scale compact 200 c
#crop_and_scale wide 200 w

#crop_and_scale base 200 s

crop_and_scale coord_jp 200 s
crop_and_scale coord_num 200 s

