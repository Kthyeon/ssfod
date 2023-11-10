#!/bin/bash
rm -rf data/soda_ssfl_iid/
mkdir data/soda_ssfl_iid

for i in {0..3}; do
    mkdir -p data/soda_ssfl_iid/ds_${i}/images/trains
    mkdir -p data/soda_ssfl_iid/ds_${i}/images/valids
    mkdir -p data/soda_ssfl_iid/ds_${i}/labels/trains
    mkdir -p data/soda_ssfl_iid/ds_${i}/labels/valids
done

# Copy all train and val to ds_0 folder;
cp -r SSLAD-2D/labeled/yolov5_format/images/train/. data/soda_ssfl_iid/ds_0/images/trains
cp -r SSLAD-2D/labeled/yolov5_format/images/val/. data/soda_ssfl_iid/ds_0/images/valids
cp -r SSLAD-2D/labeled/yolov5_format/labels/train/. data/soda_ssfl_iid/ds_0/labels/trains
cp -r SSLAD-2D/labeled/yolov5_format/labels/val/. data/soda_ssfl_iid/ds_0/labels/valids

# Move 80% of train points from ds_0 (labeled) to ds_1 (unlabeled)
python move_data.py --percent_move_train 0.75 --percent_move_valid 0.75 --source_dir data/soda_ssfl_iid/ds_0 --dest_dir data/soda_ssfl_iid/ds_1

# Evenly split train points amongst ds_1, ds_2, ds_3
python move_data.py --percent_move_train 0.33 --percent_move_valid 0.33 --source_dir data/soda_ssfl_iid/ds_1 --dest_dir data/soda_ssfl_iid/ds_2
python move_data.py --percent_move_train 0.5 --percent_move_valid 0.5 --source_dir data/soda_ssfl_iid/ds_1 --dest_dir data/soda_ssfl_iid/ds_3