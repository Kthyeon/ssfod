#!/bin/bash

rm -rf data/foggy 
rm -rf data/rainy 
rm -rf data/snowy 
rm -rf data/overcast
rm -rf data/cloudy 
rm -rf data/clear 
rm -rf data/test
rm -rf data/iid_three_clients

# IID three clients

# Foggy
curl -L -o foggy.zip "https://www.dropbox.com/scl/fi/2cce956tmm3tw76qhlekh/foggy.zip?rlkey=nx6j54vg51u9b2tf6iicazjbk&dl=1"  
# Rainy
curl -L -o rainy.zip "https://www.dropbox.com/scl/fi/1hxu2fnz67pnp8qw45xwe/rainy.zip?rlkey=kc9b11padex7nswktru6k5rqi&dl=1"
# Snowy
curl -L -o snowy.zip "https://www.dropbox.com/scl/fi/iu1qy3drrasd0llsm8d24/snowy.zip?rlkey=uipcczgrxn67c3jx3le9owvae&dl=1"
# Overcast
curl -L -o overcast.zip "https://www.dropbox.com/scl/fi/qtaq0wf4bqu0ovzd3ft7g/overcast.zip?rlkey=vtwgbvb8ltbrubqcrk22iqd5m&dl=1"
# Cloudy
curl -L -o cloudy.zip "https://www.dropbox.com/scl/fi/i8bxl9gubkfxpojkun7tt/cloudy.zip?rlkey=ok5b9wwd79hjc57gkygk2kn6j&dl=1"
# Clear
curl -L -o clear.zip "https://www.dropbox.com/scl/fi/d9qlhnt7w431rk9qoig98/clear.zip?rlkey=iq0dbk0qmvph7kuxrhi4qlflf&dl=1"
# Test
curl -L -o test.zip "https://www.dropbox.com/scl/fi/bp0n00rkv87ft488k1ffr/test.zip?rlkey=86ofi6d209a28to0boj4iabh9&dl=1"

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