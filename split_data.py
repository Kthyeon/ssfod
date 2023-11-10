'''
    Splits BDD100k object detection train data into:
        * IID: randomly split across num_clients (equal num of datapoints)
        * non-IID: each client only gets data from one weather type
        * val: only first 4 clients have val sets (each representing one weather type for non-IID)
'''

import os
import shutil 
from distutils.dir_util import copy_tree
import random


def remove(path):
    """ param <path> could either be relative or absolute. """
    if os.path.isfile(path) or os.path.islink(path):
        os.remove(path)  # remove the file
        print('Deleted previous file saved at {path}.')
    elif os.path.isdir(path):
        shutil.rmtree(path)  # remove dir and all contains
        print('Cleared old contents of folder {path}.')
    else:
        raise ValueError("file {} is not a file or dir.".format(path))

def create_folder(path):
    if not os.path.exists(path):
        os.makedirs(path)
    else:
        raise ValueError(f"{path} already exists.")
    
def move_num(src_path, dst_path, num):
    files = os.listdir(src_path)
    for file_name in random.sample(files, num):
        shutil.move(os.path.join(src_path, file_name), dst_path)
    
    
def setup_data(dir_name = 'temp', num_labeled=1, num_unlabeled=3, data_split_type = 'ssfl', iid=True, val_split_names=['cloudy', 'overcast', 'rainy', 'snowy']):
    '''
        :param (string) data_split_type: one of ['centralized', 'ssl', 'ssfl']
        :param (string list) val_split_names: default ['cloudy', 'overcast', 'rainy', 'snowy']

        Remove old data folders
        Create new data folders in following structure
            data/
                {dir_name}/
                    train/
                        ds_0_labeled/
                            labeled/
                                images/
                                    trains/
                                labels/
                                    trains/
                            (optional if labeled exists) unlabeled/
                                images/
                                    trains/
                        ds_1_unlabeled/
                        ds_2_unlabeled/
                        .
                        .
                    val/
                        {cloudy}/
                            images/
                                valids/
                            labels/
                                valids/
                        {overcast}/
                        {rainy}/
                        {snowy}/
                        .
                        .
        
        :return (dict) data_mapping: {{i}: {'train': <path>, 'val': <path>, 'target': <path>}}
    '''
    assert data_split_type in ['centralized', 'standalone', 'ssl', 'ssfl'], 'data_split_type must be one of [centralized, standalone, ssl, ssfl]'
    assert num_labeled == 1, 'num_labeled != 1 not implemented'

    data_dir = f'data/{dir_name}'
    total_num_ds = 0
    data_mapping = {}

    # Remove and recreate
    remove(data_dir)
    create_folder(f'{data_dir}')
    create_folder(f'{data_dir}/train')

    # Create labeled train
    if data_split_type == 'ssl' or data_split_type == 'centralized':
        num_labeled = 1
        num_unlabeled = 0
    elif data_split_type == 'standalone':
        num_labeled = len(val_split_names)
        num_unlabeled = 0

    for i in range(num_labeled):
        create_folder(f'{data_dir}/train/ds_{i}_labeled')
        create_folder(f'{data_dir}/train/ds_{i}_labeled/labeled')
        create_folder(f'{data_dir}/train/ds_{i}_labeled/labeled/images')
        create_folder(f'{data_dir}/train/ds_{i}_labeled/labeled/images/trains')
        create_folder(f'{data_dir}/train/ds_{i}_labeled/labeled/labels')
        create_folder(f'{data_dir}/train/ds_{i}_labeled/labeled/labels/trains')
        
        if i == 0 and data_split_type == 'ssl':
            # Also create unlabeled folder for first datasource
            create_folder(f'{data_dir}/train/ds_{i}_unlabeled')
            create_folder(f'{data_dir}/train/ds_{i}_unlabeled/unlabeled')
            create_folder(f'{data_dir}/train/ds_{i}_unlabeled/unlabeled/images')
            create_folder(f'{data_dir}/train/ds_{i}_unlabeled/unlabeled/images/trains')
            data_mapping[i] = {
                'train': f'{data_dir}/train/ds_{i}_labeled/labeled/images/trains',
                'target': f'{data_dir}/train/ds_{i}_unlabeled/unlabeled/images/trains'
            }
        else:
            data_mapping[i] = {
                'train': f'{data_dir}/train/ds_{i}_labeled/labeled/images/trains',
                'target': 'empty'
            }

        total_num_ds += 1
    print(f'Created {total_num_ds} labeled train folder(s)')

    # Create unlabeled train
    for i in range(num_labeled, num_labeled+num_unlabeled):
        create_folder(f'{data_dir}/train/ds_{i}_unlabeled')
        create_folder(f'{data_dir}/train/ds_{i}_unlabeled/unlabeled')
        create_folder(f'{data_dir}/train/ds_{i}_unlabeled/unlabeled/images')
        create_folder(f'{data_dir}/train/ds_{i}_unlabeled/unlabeled/images/trains')

        data_mapping[i] = {
            'train': 'empty',
            'target': f'{data_dir}/train/ds_{i}_unlabeled/unlabeled/images/trains'
        }

        total_num_ds += 1

    print(f'Created {total_num_ds} unlabeled train folder(s)')

    # Create val
    create_folder(f'{data_dir}/val')
    for i in range(len(val_split_names)):
        create_folder(f'{data_dir}/val/{val_split_names[i]}')
        create_folder(f'{data_dir}/val/{val_split_names[i]}/images')
        create_folder(f'{data_dir}/val/{val_split_names[i]}/images/valids')
        create_folder(f'{data_dir}/val/{val_split_names[i]}/labels')
        create_folder(f'{data_dir}/val/{val_split_names[i]}/labels/valids')
    
        # Val -- copy folder over
        copy_tree(f'data/{val_split_names[i]}/images/valids', f'{data_dir}/val/{val_split_names[i]}/images/valids')
        copy_tree(f'data/{val_split_names[i]}/labels/valids', f'{data_dir}/val/{val_split_names[i]}/labels/valids')

    print(f'Created {len(val_split_names)} val folder(s)')

    # Move train data to each folder and map val data
    if data_split_type == 'centralized':
        # Train -- move all to first datasource
        copy_tree('data/cloudy/images/trains', f'{data_dir}/train/ds_0_labeled/labeled/images/trains')
        copy_tree('data/cloudy/labels/trains', f'{data_dir}/train/ds_0_labeled/labeled/labels/trains')
        copy_tree('data/overcast/images/trains', f'{data_dir}/train/ds_0_labeled/labeled/images/trains')
        copy_tree('data/overcast/labels/trains', f'{data_dir}/train/ds_0_labeled/labeled/labels/trains')
        copy_tree('data/rainy/images/trains', f'{data_dir}/train/ds_0_labeled/labeled/images/trains')
        copy_tree('data/rainy/labels/trains', f'{data_dir}/train/ds_0_labeled/labeled/labels/trains')
        copy_tree('data/snowy/images/trains', f'{data_dir}/train/ds_0_labeled/labeled/images/trains')
        copy_tree('data/snowy/labels/trains', f'{data_dir}/train/ds_0_labeled/labeled/labels/trains')
    
        # Val mapping -- one datasource for each val split
        for i in range(len(val_split_names)):
            if i in data_mapping:
                data_mapping[i]['val'] = f'{data_dir}/val/{val_split_names[i]}/images/valids'
                data_mapping[i]['test'] = f'{data_dir}/val/{val_split_names[i]}/images/valids'
            else:
                data_mapping[i] = {
                    'val': f'{data_dir}/val/{val_split_names[i]}/images/valids',
                    'test': f'{data_dir}/val/{val_split_names[i]}/images/valids',
                    'train': 'empty',
                    'target': 'empty'
                }

    elif data_split_type == 'ssl':
        if iid: 
            # Train -- 
            raise NotImplementedError
        
        else:
            # Train -- first datasource has all labeled and unlabeled in separate folders
            copy_tree('data/cloudy/images/trains', f'{data_dir}/train/ds_0_labeled/labeled/images/trains')
            copy_tree('data/cloudy/labels/trains', f'{data_dir}/train/ds_0_labeled/labeled/labels/trains')
            # Train -- unlabeled
            copy_tree('data/overcast/images/trains', f'{data_dir}/train/ds_0_unlabeled/unlabeled/images/trains')
            copy_tree('data/rainy/images/trains', f'{data_dir}/train/ds_0_unlabeled/unlabeled/images/trains')
            copy_tree('data/snowy/images/trains', f'{data_dir}/train/ds_0_unlabeled/unlabeled/images/trains')
        
        # Val mapping -- one datasource for each val split
        for i in range(len(val_split_names)):
            if i in data_mapping:
                data_mapping[i]['val'] = f'{data_dir}/val/{val_split_names[i]}/images/valids'
                data_mapping[i]['test'] = f'{data_dir}/val/{val_split_names[i]}/images/valids'
            else:
                data_mapping[i] = {
                    'val': f'{data_dir}/val/{val_split_names[i]}/images/valids',
                    'test': f'{data_dir}/val/{val_split_names[i]}/images/valids',
                    'train': 'empty',
                    'target': 'empty'
                }

    elif data_split_type == 'ssfl':
        if iid:
            raise NotImplementedError

        else:
            # 1 labeled datasource
            copy_tree('data/cloudy/images/trains', f'{data_dir}/train/ds_0_labeled/labeled/images/trains')
            copy_tree('data/cloudy/labels/trains', f'{data_dir}/train/ds_0_labeled/labeled/labels/trains')
            
            # Divide unlabeled datasource into n non-iid unlabeled datasources
            assert num_unlabeled >= len(val_split_names), 'In non-IID SSFL, number of unlabeled must >= len(val_split_names)'
            frac_per_ds = len(val_split_names) * 1.0 / num_unlabeled
            num_to_move = {}
            # First put all into len(val_split_names) unlabeled datasources
            for val_i in range(len(val_split_names)):
                copy_tree(f'data/{val_split_names[val_i]}/images/trains', f'{data_dir}/train/ds_{val_i}_unlabeled/unlabeled/images/trains')
                temp_files = os.listdir(f'data/{val_split_names[val_i]}/images/trains')
                num_to_move[f'{val_split_names[val_i]}'] = frac_per_ds * len(temp_files)

                data_mapping[1]['val'] = f'{data_dir}/val/{val_split_names[val_i]}/images/valids'
                data_mapping[1]['test'] = f'{data_dir}/val/{val_split_names[val_i]}/images/valids'
            
            # Split across rest of unlabeled datasources
            for unlabeled_i in range(len(val_split_names) + num_labeled, num_labeled + num_unlabeled):








def main():
    setup_data()


if __name__ == '__main__':
    main()