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
cp -r data/cloudy/images/trains/. data/1ds_ssl_iid_20perc/unlabeled/images/trains
cp -r data/cloudy/labels/trains/. data/1ds_ssl_iid_20perc/unlabeled/labels/trains
# Copy cloudy valids to labeled folder
cp -r data/cloudy/images/valids/. data/1ds_ssl_iid_20perc/labeled/images/valids
cp -r data/cloudy/labels/valids/. data/1ds_ssl_iid_20perc/labeled/labels/valids

cp -r data/overcast/images/trains/. data/1ds_ssl_iid_20perc/unlabeled/images/trains
cp -r data/overcast/images/valids/. data/1ds_ssl_iid_20perc/unlabeled/images/valids
cp -r data/overcast/labels/trains/. data/1ds_ssl_iid_20perc/unlabeled/labels/trains
cp -r data/overcast/labels/valids/. data/1ds_ssl_iid_20perc/unlabeled/labels/valids

cp -r data/rainy/images/trains/. data/1ds_ssl_iid_20perc/unlabeled/images/trains
cp -r data/rainy/images/valids/. data/1ds_ssl_iid_20perc/unlabeled/images/valids
cp -r data/rainy/labels/trains/. data/1ds_ssl_iid_20perc/unlabeled/labels/trains
cp -r data/rainy/labels/valids/. data/1ds_ssl_iid_20perc/unlabeled/labels/valids

cp -r data/snowy/images/trains/. data/1ds_ssl_iid_20perc/unlabeled/images/trains
cp -r data/snowy/images/valids/. data/1ds_ssl_iid_20perc/unlabeled/images/valids
cp -r data/snowy/labels/trains/. data/1ds_ssl_iid_20perc/unlabeled/labels/trains
cp -r data/snowy/labels/valids/. data/1ds_ssl_iid_20perc/unlabeled/labels/valids



# Move a certain num of train datapoints to labeled folder
python move_data.py --percent_move_train 0.2 --percent_move_valid 0.0 --source_dir data/1ds_ssl_iid_20perc/unlabeled --dest_dir data/1ds_ssl_iid_20perc/labeled
