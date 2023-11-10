#!/bin/bash
rm -rf data/centralized_separate_tests/
mkdir data/centralized_separate_tests

# Labeled
mkdir data/centralized_separate_tests/ds_0
mkdir data/centralized_separate_tests/ds_0/images
mkdir data/centralized_separate_tests/ds_0/images/trains
mkdir data/centralized_separate_tests/ds_0/images/valids
mkdir data/centralized_separate_tests/ds_0/labels
mkdir data/centralized_separate_tests/ds_0/labels/trains
mkdir data/centralized_separate_tests/ds_0/labels/valids

# Unlabeled 
mkdir data/centralized_separate_tests/ds_1
mkdir data/centralized_separate_tests/ds_1/images
mkdir data/centralized_separate_tests/ds_1/images/trains
mkdir data/centralized_separate_tests/ds_1/images/valids
mkdir data/centralized_separate_tests/ds_1/labels
mkdir data/centralized_separate_tests/ds_1/labels/trains
mkdir data/centralized_separate_tests/ds_1/labels/valids

mkdir data/centralized_separate_tests/ds_2
mkdir data/centralized_separate_tests/ds_2/images
mkdir data/centralized_separate_tests/ds_2/images/trains
mkdir data/centralized_separate_tests/ds_2/images/valids
mkdir data/centralized_separate_tests/ds_2/labels
mkdir data/centralized_separate_tests/ds_2/labels/trains
mkdir data/centralized_separate_tests/ds_2/labels/valids

mkdir data/centralized_separate_tests/ds_3
mkdir data/centralized_separate_tests/ds_3/images
mkdir data/centralized_separate_tests/ds_3/images/trains
mkdir data/centralized_separate_tests/ds_3/images/valids
mkdir data/centralized_separate_tests/ds_3/labels
mkdir data/centralized_separate_tests/ds_3/labels/trains
mkdir data/centralized_separate_tests/ds_3/labels/valids


# Centralized gets all trains
cp -r data/cloudy/images/trains/. data/centralized_separate_tests/ds_0/images/trains
cp -r data/cloudy/images/valids/. data/centralized_separate_tests/ds_0/images/valids
cp -r data/cloudy/labels/trains/. data/centralized_separate_tests/ds_0/labels/trains
cp -r data/cloudy/labels/valids/. data/centralized_separate_tests/ds_0/labels/valids

cp -r data/overcast/images/trains/. data/centralized_separate_tests/ds_0/images/trains
cp -r data/overcast/images/valids/. data/centralized_separate_tests/ds_1/images/valids
cp -r data/overcast/labels/trains/. data/centralized_separate_tests/ds_0/labels/trains
cp -r data/overcast/labels/valids/. data/centralized_separate_tests/ds_1/labels/valids

cp -r data/rainy/images/trains/. data/centralized_separate_tests/ds_0/images/trains
cp -r data/rainy/images/valids/. data/centralized_separate_tests/ds_2/images/valids
cp -r data/rainy/labels/trains/. data/centralized_separate_tests/ds_0/labels/trains
cp -r data/rainy/labels/valids/. data/centralized_separate_tests/ds_2/labels/valids

cp -r data/snowy/images/trains/. data/centralized_separate_tests/ds_0/images/trains
cp -r data/snowy/images/valids/. data/centralized_separate_tests/ds_3/images/valids
cp -r data/snowy/labels/trains/. data/centralized_separate_tests/ds_0/labels/trains
cp -r data/snowy/labels/valids/. data/centralized_separate_tests/ds_3/labels/valids
