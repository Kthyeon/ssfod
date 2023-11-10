#!/bin/bash

# rm -rf data
# rm -rf foggy 
# rm -rf rainy 
# rm -rf snowy 
# rm -rf overcast
# rm -rf cloudy 
# rm -rf clear 
# rm -rf test

mkdir data
mkdir data/iid_three_clients

gdown 1d1-lEnVYqmkOish6_zwVRq890gG_ljSl  # IID 3 clients
gdown 11KVlnd6_PhTjU5H6sW3mieDCjPk5Kfzt  # foggy 
gdown 16sGSxw2BPAIRKNs8IrEE9iY4dbbFVOFY  # rainy
gdown 1wrVHg7HpkPW9nMLTapixXH1uPUQw9H_j  # snowy
gdown 1NQOEIOC7vNHq2Ncrd2PgjQgG1RjruhBQ  # overcast
gdown 1U4-umMJf4_ZfaJJ-BgpMBPJHEY6Oea36  # cloudy
gdown 1dpFVr4NCJdJi7_VCUJl0hLAnuovrWoO0  # clear
gdown 1ETGEGpFkC2DnjfWKkSLY7l66XJBbKtw0 # test

unzip iid_three_clients.zip
rm iid_three_clients.zip
mv client_0 data/iid_three_clients
mv client_1 data/iid_three_clients
mv client_2 data/iid_three_clients

unzip foggy.zip
rm foggy.zip
mv foggy data

unzip rainy.zip
rm rainy.zip
mv rainy data

unzip snowy.zip
rm snowy.zip
mv snowy data

unzip overcast.zip
rm overcast.zip
mv overcast data

unzip cloudy.zip
rm cloudy.zip
mv cloudy data

unzip clear.zip
rm clear.zip
mv clear data

unzip test.zip
rm test.zip
mv test data