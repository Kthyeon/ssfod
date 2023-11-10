#!/bin/bash
rm -rf data/1datasource_ssl/

mkdir data/1datasource_ssl
mkdir data/1datasource_ssl/labeled
mkdir data/1datasource_ssl/labeled/images
mkdir data/1datasource_ssl/labeled/images/trains
mkdir data/1datasource_ssl/labeled/images/valids
mkdir data/1datasource_ssl/labeled/labels
mkdir data/1datasource_ssl/labeled/labels/trains
mkdir data/1datasource_ssl/labeled/labels/valids


mkdir data/1datasource_ssl/unlabeled
mkdir data/1datasource_ssl/unlabeled/images
mkdir data/1datasource_ssl/unlabeled/images/trains
mkdir data/1datasource_ssl/unlabeled/images/valids
mkdir data/1datasource_ssl/unlabeled/labels
mkdir data/1datasource_ssl/unlabeled/labels/trains
mkdir data/1datasource_ssl/unlabeled/labels/valids

cp -r data/cloudy/images/trains/. data/1datasource_ssl/labeled/images/trains
cp -r data/cloudy/images/valids/. data/1datasource_ssl/labeled/images/valids
cp -r data/cloudy/labels/trains/. data/1datasource_ssl/labeled/labels/trains
cp -r data/cloudy/labels/valids/. data/1datasource_ssl/labeled/labels/valids

cp -r data/overcast/images/trains/. data/1datasource_ssl/unlabeled/images/trains
cp -r data/overcast/images/valids/. data/1datasource_ssl/labeled/images/valids
cp -r data/overcast/labels/trains/. data/1datasource_ssl/unlabeled/labels/trains
cp -r data/overcast/labels/valids/. data/1datasource_ssl/labeled/labels/valids

cp -r data/rainy/images/trains/. data/1datasource_ssl/unlabeled/images/trains
cp -r data/rainy/images/valids/. data/1datasource_ssl/labeled/images/valids
cp -r data/rainy/labels/trains/. data/1datasource_ssl/unlabeled/labels/trains
cp -r data/rainy/labels/valids/. data/1datasource_ssl/labeled/labels/valids

cp -r data/snowy/images/trains/. data/1datasource_ssl/unlabeled/images/trains
cp -r data/snowy/images/valids/. data/1datasource_ssl/labeled/images/valids
cp -r data/snowy/labels/trains/. data/1datasource_ssl/unlabeled/labels/trains
cp -r data/snowy/labels/valids/. data/1datasource_ssl/labeled/labels/valids

# cp -r data/iid_three_clients/client_0/images/trains/. data/1datasource_ssl/labeled/images/trains
# cp -r data/iid_three_clients/client_1/images/trains/. data/1datasource_ssl/labeled/images/trains
# cp -r data/iid_three_clients/client_2/images/trains/. data/1datasource_ssl/unlabeled/images/trains

# cp -r data/iid_three_clients/client_0/images/valids/. data/1datasource_ssl/labeled/images/valids
# cp -r data/iid_three_clients/client_1/images/valids/. data/1datasource_ssl/labeled/images/valids
# cp -r data/iid_three_clients/client_2/images/valids/. data/1datasource_ssl/unlabeled/images/valids

# cp -r data/iid_three_clients/client_0/labels/trains/. data/1datasource_ssl/labeled/labels/trains
# cp -r data/iid_three_clients/client_1/labels/trains/. data/1datasource_ssl/labeled/labels/trains
# cp -r data/iid_three_clients/client_2/labels/trains/. data/1datasource_ssl/unlabeled/labels/trains

# cp -r data/iid_three_clients/client_0/labels/valids/. data/1datasource_ssl/labeled/labels/valids
# cp -r data/iid_three_clients/client_1/labels/valids/. data/1datasource_ssl/labeled/labels/valids
# cp -r data/iid_three_clients/client_2/labels/valids/. data/1datasource_ssl/unlabeled/labels/valids




