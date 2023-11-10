#!/bin/bash
rm -rf data/ssfl_bdd_niid_4ds/
mkdir data/ssfl_bdd_niid_4ds

# Labeled
mkdir data/ssfl_bdd_niid_4ds/ds_0
mkdir data/ssfl_bdd_niid_4ds/ds_0/images
mkdir data/ssfl_bdd_niid_4ds/ds_0/images/trains
mkdir data/ssfl_bdd_niid_4ds/ds_0/images/valids
mkdir data/ssfl_bdd_niid_4ds/ds_0/labels
mkdir data/ssfl_bdd_niid_4ds/ds_0/labels/trains
mkdir data/ssfl_bdd_niid_4ds/ds_0/labels/valids

# Unlabeled 
mkdir data/ssfl_bdd_niid_4ds/ds_1
mkdir data/ssfl_bdd_niid_4ds/ds_1/images
mkdir data/ssfl_bdd_niid_4ds/ds_1/images/trains
mkdir data/ssfl_bdd_niid_4ds/ds_1/images/valids
mkdir data/ssfl_bdd_niid_4ds/ds_1/labels
mkdir data/ssfl_bdd_niid_4ds/ds_1/labels/trains
mkdir data/ssfl_bdd_niid_4ds/ds_1/labels/valids

mkdir data/ssfl_bdd_niid_4ds/ds_2
mkdir data/ssfl_bdd_niid_4ds/ds_2/images
mkdir data/ssfl_bdd_niid_4ds/ds_2/images/trains
mkdir data/ssfl_bdd_niid_4ds/ds_2/images/valids
mkdir data/ssfl_bdd_niid_4ds/ds_2/labels
mkdir data/ssfl_bdd_niid_4ds/ds_2/labels/trains
mkdir data/ssfl_bdd_niid_4ds/ds_2/labels/valids

mkdir data/ssfl_bdd_niid_4ds/ds_3
mkdir data/ssfl_bdd_niid_4ds/ds_3/images
mkdir data/ssfl_bdd_niid_4ds/ds_3/images/trains
mkdir data/ssfl_bdd_niid_4ds/ds_3/images/valids
mkdir data/ssfl_bdd_niid_4ds/ds_3/labels
mkdir data/ssfl_bdd_niid_4ds/ds_3/labels/trains
mkdir data/ssfl_bdd_niid_4ds/ds_3/labels/valids


# BDD
cp -r data/cloudy/images/trains/. data/ssfl_bdd_niid_4ds/ds_0/images/trains
cp -r data/cloudy/images/valids/. data/ssfl_bdd_niid_4ds/ds_0/images/valids
cp -r data/cloudy/labels/trains/. data/ssfl_bdd_niid_4ds/ds_0/labels/trains
cp -r data/cloudy/labels/valids/. data/ssfl_bdd_niid_4ds/ds_0/labels/valids

cp -r data/overcast/images/trains/. data/ssfl_bdd_niid_4ds/ds_1/images/trains
cp -r data/overcast/images/valids/. data/ssfl_bdd_niid_4ds/ds_1/images/valids
cp -r data/overcast/labels/trains/. data/ssfl_bdd_niid_4ds/ds_1/labels/trains
cp -r data/overcast/labels/valids/. data/ssfl_bdd_niid_4ds/ds_1/labels/valids

cp -r data/rainy/images/trains/. data/ssfl_bdd_niid_4ds/ds_2/images/trains
cp -r data/rainy/images/valids/. data/ssfl_bdd_niid_4ds/ds_2/images/valids
cp -r data/rainy/labels/trains/. data/ssfl_bdd_niid_4ds/ds_2/labels/trains
cp -r data/rainy/labels/valids/. data/ssfl_bdd_niid_4ds/ds_2/labels/valids

cp -r data/snowy/images/trains/. data/ssfl_bdd_niid_4ds/ds_3/images/trains
cp -r data/snowy/images/valids/. data/ssfl_bdd_niid_4ds/ds_3/images/valids
cp -r data/snowy/labels/trains/. data/ssfl_bdd_niid_4ds/ds_3/labels/trains
cp -r data/snowy/labels/valids/. data/ssfl_bdd_niid_4ds/ds_3/labels/valids
