#!/bin/bash
rm -rf data/soda_centralized/

mkdir data/soda_centralized
mkdir data/soda_centralized/images
mkdir data/soda_centralized/images/trains
mkdir data/soda_centralized/images/valids
mkdir data/soda_centralized/labels
mkdir data/soda_centralized/labels/trains
mkdir data/soda_centralized/labels/valids

cp -r SSLAD-2D/labeled/yolov5_format/images/train/. data/soda_centralized/images/trains
cp -r SSLAD-2D/labeled/yolov5_format/images/val/. data/soda_centralized/images/valids
cp -r SSLAD-2D/labeled/yolov5_format/labels/train/. data/soda_centralized/labels/trains
cp -r SSLAD-2D/labeled/yolov5_format/labels/val/. data/soda_centralized/labels/valids


