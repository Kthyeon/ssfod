#!/bin/bash
rm -rf data/1ds_ssl_iid_20perc/

mkdir data/1ds_ssl_iid_20perc
mkdir data/1ds_ssl_iid_20perc/labeled
mkdir data/1ds_ssl_iid_20perc/labeled/images
mkdir data/1ds_ssl_iid_20perc/labeled/images/trains
mkdir data/1ds_ssl_iid_20perc/labeled/images/valids
mkdir data/1ds_ssl_iid_20perc/labeled/labels
mkdir data/1ds_ssl_iid_20perc/labeled/labels/trains
mkdir data/1ds_ssl_iid_20perc/labeled/labels/valids

mkdir data/1ds_ssl_iid_20perc/unlabeled
mkdir data/1ds_ssl_iid_20perc/unlabeled/images
mkdir data/1ds_ssl_iid_20perc/unlabeled/images/trains
mkdir data/1ds_ssl_iid_20perc/unlabeled/images/valids
mkdir data/1ds_ssl_iid_20perc/unlabeled/labels
mkdir data/1ds_ssl_iid_20perc/unlabeled/labels/trains
mkdir data/1ds_ssl_iid_20perc/unlabeled/labels/valids

# First copy all train data to unlabeled folder 
cp -r SSLAD-2D/labeled/yolov5_format/images/train/. data/1ds_ssl_iid_20perc/labeled/images/trains
cp -r SSLAD-2D/labeled/yolov5_format/images/val/. data/1ds_ssl_iid_20perc/labeled/images/valids
cp -r SSLAD-2D/labeled/yolov5_format/labels/train/. data/1ds_ssl_iid_20perc/labeled/labels/trains
cp -r SSLAD-2D/labeled/yolov5_format/labels/val/. data/1ds_ssl_iid_20perc/labeled/labels/valids

# Move a certain num of train datapoints to labeled folder
python move_data.py --percent_move_train 0.75 --percent_move_valid 0.75 --source_dir data/1ds_ssl_iid_20perc/labeled --dest_dir data/1ds_ssl_iid_20perc/unlabeled