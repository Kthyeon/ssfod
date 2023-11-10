import json
import os
import shutil

def convert_box(size, box):
    dw, dh = 1. / size[0], 1. / size[1]
    x, y, w, h = (box[0] + box[1]) / 2.0, (box[2] + box[3]) / 2.0, box[1] - box[0], box[3] - box[2]
    return x * dw, y * dh, w * dw, h * dh


def convert_label(annotations, img_height, img_width, output_path, class_names):
    out_file = open(output_path, 'w')

    for annotation in annotations:
        category_id = annotation['category_id']
        bbox = annotation['bbox']
        cls_id = category_id - 1
        x, y, w, h = bbox
        bb = convert_box((img_width, img_height), [x, x + w, y, y + h])
        out_file.write(" ".join([str(a) for a in (cls_id, *bb)]) + '\n')

def create_directories(base_path, 
                       weather=['Clear', 'Overcast', 'Rainy', 'Snowy']):
    '''
        Create 4 clients based on weather condition from SODA10m labeled dataset
        but, you can create dataloaders from unlabeled if you want
    '''
    for w in weather:
        weather_path = os.path.join(base_path, w)
        os.makedirs(os.path.join(weather_path, 'images', 'trains'), exist_ok=True)
        os.makedirs(os.path.join(weather_path, 'images', 'valids'), exist_ok=True)
        os.makedirs(os.path.join(weather_path, 'labels', 'trains'), exist_ok=True)
        os.makedirs(os.path.join(weather_path, 'labels', 'valids'), exist_ok=True)


def parse_input_data(data):
    '''
        parse input data from annotation (*.json) with
            categories, annotations, images according to the image_id
    '''
    categories = {c['id']: c['name'] for c in data['categories']}
    annotations = data['annotations']
    images = data['images']
    return categories, annotations, images

def process_images(base_path, categories, annotations, images, image_folder, class_names, image_set):
    '''
        base_path: original path to be processed
        categories: dict -> key, value = class_id, name
        annotations: dict -> key, value = image_id, name
        images: list of dict -> 
            key, value = {file_name, id, location, period, weather, height, width}
        image_folder: path for images
    '''
    img_width, img_height = 1920, 1080

    for image in images:
        weather = image['weather']
        image_id = image['id']
        img_annotations = [annotation for annotation in annotations if annotation['image_id'] == image_id]
        if img_annotations:
            img_file_name = image['file_name']
            label_path = os.path.join(base_path, weather, 'labels', image_set)
            imgs_path = os.path.join(base_path, weather, 'images', image_set)

            output_label_path = os.path.join(label_path, img_file_name.replace('.jpg', '.txt'))
            convert_label(img_annotations, img_height, img_width, output_label_path, class_names)

            src_img_path = os.path.join(image_folder, img_file_name)
            dest_img_path = os.path.join(imgs_path, img_file_name)
            shutil.copy(src_img_path, dest_img_path)
            print(src_img_path, dest_img_path)


if __name__ == "__main__":
    #  setup path
    data_dir = './SSLAD-2D/labeled'
    dir_set = ['trains', 'valids']
    class_names = ['Pedestrian', 'Cyclist', 'Car', 'Truck', 'Tram', 'Tricycle']

    # create directories
    output_base_path = './data/soda_niid'
    create_directories(output_base_path)

    for image_set in dir_set:
        json_file = os.path.join(data_dir, 'annotations', image_set+'.json')

        with open(json_file, 'r') as f:
            data = json.load(f)

        categories, annotations, images = parse_input_data(data)

        # process images and create labels
        image_folder = os.path.join(data_dir, image_set)
        process_images(output_base_path, categories, annotations, images, image_folder, class_names, image_set)


