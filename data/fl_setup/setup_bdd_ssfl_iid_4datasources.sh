#!/bin/bash

dir_name=data/ssfl_bdd_iid_4ds
num_datasets=4

# Remove and create the data/ssfl_iid directory
rm -rf $dir_name/
mkdir $dir_name

# Create directories for each of the 100 data sources
for i in $(seq 0 $((num_datasets - 1))); do
  dataset_dir=$dir_name/ds_$i
  mkdir $dataset_dir
  mkdir $dataset_dir/images
  mkdir $dataset_dir/images/trains
  mkdir $dataset_dir/images/valids
  mkdir $dataset_dir/labels
  mkdir $dataset_dir/labels/trains
  mkdir $dataset_dir/labels/valids
done

# Copy all train and val data to ds_0 folder (assuming you have already prepared the data)
directories=("clear" "overcast" "cloudy" "rainy" "snowy")

for dir in "${directories[@]}"
do
  cp -r "data/$dir/images/trains/." "$dir_name/ds_0/images/trains"
  cp -r "data/$dir/images/valids/." "$dir_name/ds_0/images/valids"

  cp -r "data/$dir/labels/trains/." "$dir_name/ds_0/labels/trains"
  cp -r "data/$dir/labels/valids/." "$dir_name/ds_0/labels/valids"
done

# Move data from ds_0 to other datasets
for i in $(seq 1 $((num_datasets - 1))); do
  remaining_datasets=$((num_datasets - i + 1))
  percent_move_train=$(python3 -c "print(format(1/$remaining_datasets, '.3f'))")
  percent_move_valid=$(python3 -c "print(format(1/$remaining_datasets, '.3f'))")

  source_dir=$dir_name/ds_0
  dest_dir=$dir_name/ds_$i
  python3 move_data.py --percent_move_train $percent_move_train --percent_move_valid $percent_move_valid --source_dir $source_dir --dest_dir $dest_dir
done
