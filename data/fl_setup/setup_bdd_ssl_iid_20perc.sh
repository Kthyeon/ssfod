#!/bin/bash
rm -rf data/ssl_iid_20perc/

mkdir data/ssl_iid_20perc
mkdir data/ssl_iid_20perc/labeled
mkdir data/ssl_iid_20perc/labeled/images
mkdir data/ssl_iid_20perc/labeled/images/trains
# mkdir data/ssl_iid_20perc/labeled/images/valids
mkdir data/ssl_iid_20perc/labeled/labels
mkdir data/ssl_iid_20perc/labeled/labels/trains
# mkdir data/ssl_iid_20perc/labeled/labels/valids

mkdir data/ssl_iid_20perc/unlabeled
mkdir data/ssl_iid_20perc/unlabeled/images
mkdir data/ssl_iid_20perc/unlabeled/images/trains
mkdir data/ssl_iid_20perc/unlabeled/images/valids
mkdir data/ssl_iid_20perc/unlabeled/labels
mkdir data/ssl_iid_20perc/unlabeled/labels/trains
mkdir data/ssl_iid_20perc/unlabeled/labels/valids

# First move all train datapoints to unlabeled
# Labeled train = 20 percent of {cloudy,overcast, rainy, snowy}; unlabeled = 80 percent of {cloudy,overcast, rainy, snowy}
cp -r data/cloudy/images/trains/. data/ssl_iid_20perc/unlabeled/images/trains
cp -r data/cloudy/labels/trains/. data/ssl_iid_20perc/unlabeled/labels/trains
# cp -r data/cloudy/images/valids/. data/ssl_iid_20perc/labeled/images/valids
# cp -r data/cloudy/labels/valids/. data/ssl_iid_20perc/labeled/labels/valids

cp -r data/overcast/images/trains/. data/ssl_iid_20perc/unlabeled/images/trains
# cp -r data/overcast/images/valids/. data/ssl_iid_20perc/unlabeled/images/valids
cp -r data/overcast/labels/trains/. data/ssl_iid_20perc/unlabeled/labels/trains
# cp -r data/overcast/labels/valids/. data/ssl_iid_20perc/unlabeled/labels/valids

cp -r data/rainy/images/trains/. data/ssl_iid_20perc/unlabeled/images/trains
# cp -r data/rainy/images/valids/. data/ssl_iid_20perc/unlabeled/images/valids
cp -r data/rainy/labels/trains/. data/ssl_iid_20perc/unlabeled/labels/trains
# cp -r data/rainy/labels/valids/. data/ssl_iid_20perc/unlabeled/labels/valids

cp -r data/snowy/images/trains/. data/ssl_iid_20perc/unlabeled/images/trains
# cp -r data/snowy/images/valids/. data/ssl_iid_20perc/unlabeled/images/valids
cp -r data/snowy/labels/trains/. data/ssl_iid_20perc/unlabeled/labels/trains
# cp -r data/snowy/labels/valids/. data/ssl_iid_20perc/unlabeled/labels/valids

# Move a certain num of train datapoints to labeled folder
python move_data.py --percent_move_train 0.2 --percent_move_valid 0.0 --source_dir data/ssl_iid_20perc/unlabeled --dest_dir data/ssl_iid_20perc/labeled
