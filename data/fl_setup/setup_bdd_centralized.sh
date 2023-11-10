#!/bin/bash
rm -rf data/centralized/

mkdir data/centralized
mkdir data/centralized
mkdir data/centralized/images
mkdir data/centralized/images/trains
mkdir data/centralized/images/valids
mkdir data/centralized/labels
mkdir data/centralized/labels/trains
mkdir data/centralized/labels/valids

# Copy all data to centralized folder 
cp -r data/cloudy/images/trains/. data/centralized/images/trains
cp -r data/cloudy/labels/trains/. data/centralized/labels/trains
cp -r data/cloudy/images/valids/. data/centralized/images/valids
cp -r data/cloudy/labels/valids/. data/centralized/labels/valids

cp -r data/overcast/images/trains/. data/centralized/images/trains
cp -r data/overcast/images/valids/. data/centralized/images/valids
cp -r data/overcast/labels/trains/. data/centralized/labels/trains
cp -r data/overcast/labels/valids/. data/centralized/labels/valids

cp -r data/rainy/images/trains/. data/centralized/images/trains
cp -r data/rainy/images/valids/. data/centralized/images/valids
cp -r data/rainy/labels/trains/. data/centralized/labels/trains
cp -r data/rainy/labels/valids/. data/centralized/labels/valids

cp -r data/snowy/images/trains/. data/centralized/images/trains
cp -r data/snowy/images/valids/. data/centralized/images/valids
cp -r data/snowy/labels/trains/. data/centralized/labels/trains
cp -r data/snowy/labels/valids/. data/centralized/labels/valids

