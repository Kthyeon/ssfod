#!/bin/bash


# Move 33% of train points from ds_0 (labeled) to ds_1 (unlabeled)
python move_data.py --percent_move_train 0.33 --percent_move_valid 0 --source_dir SSLAD-2D/unlabel/image_0 --dest_dir data/soda_niid/Overcast --soda_niid

# Evenly split train points amongst ds_1, ds_2, ds_3
python move_data.py --percent_move_train 0.5 --percent_move_valid 0 --source_dir SSLAD-2D/unlabel/image_0 --dest_dir data/soda_niid/Rainy --soda_niid
python move_data.py --percent_move_train 1.0 --percent_move_valid 0 --source_dir SSLAD-2D/unlabel/image_0 --dest_dir data/soda_niid/Snowy --soda_niid