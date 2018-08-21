#!/bin/bash

set -e
set -x

scale() {
    fn=$1
    width=$2
    convert -resize $width ${fn}.png ${fn}.jpg
}

crop_and_scale() {
    fn=$1
    width=$2
    crop ${fn}
    scale ${fn}_main ${width}
}

#scale init_pc 444
scale shogi_harbour 600

