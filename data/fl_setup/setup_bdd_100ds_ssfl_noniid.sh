#!/bin/bash
# Assumes you already ran download_bdd.sh
# Splits 4 weather types (cloudy, overcast, rainy, snowy) into N datasets; N > len(weather_types)
# Labeled -- 1 ds with cloudy
# Unlabeled -- 33 ds with overcast, 33 ds with rainy, 33 ds with snowy

dir_name=data/ssfl_bdd_niid_100ds
num_datasets=100    # must be greater than 4 (there are 4 weather types)
directories=("cloudy" "overcast" "rainy" "snowy")
directories_len=${#directories[@]}

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

# Copy entire directories[0] to ds_0, directories[1] to ds_1, ...
for (( i=0; i<directories_len; i++ ));
do
    cp -r "data/${directories[$i]}/images/trains/." "$dir_name/ds_$i/images/trains"
    cp -r "data/${directories[$i]}/images/valids/." "$dir_name/ds_$i/images/valids"
    cp -r "data/${directories[$i]}/labels/trains/." "$dir_name/ds_$i/labels/trains"
    cp -r "data/${directories[$i]}/labels/valids/." "$dir_name/ds_$i/labels/valids"
done

# Move data from ds_1 to {4,7,10,...}, ds_2 to {5,8,11,...}, ds_3 to {6,9,12,...}
for i in $(seq $directories_len $((num_datasets - 1))); do

  num_unlabeled=$(($directories_len - 1))
  mod_unlabeled=$((i % $num_unlabeled))
  remaining_datasets=$((((num_datasets - 1 - i) / $num_unlabeled) + 2))
  if ((mod_unlabeled == 0))
  then 
     mod_unlabeled=$num_unlabeled
  fi

  source_dir=$dir_name/ds_$mod_unlabeled
  dest_dir=$dir_name/ds_$i

  percent_move_train=$(python3 -c "print(format(1/$remaining_datasets, '.3f'))")
  percent_move_valid=$(python3 -c "print(format(1/$remaining_datasets, '.3f'))")

  python3 move_data.py --percent_move_train $percent_move_train --percent_move_valid $percent_move_valid --source_dir $source_dir --dest_dir $dest_dir
done
