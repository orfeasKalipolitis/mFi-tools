#!/bin/sh

LOCALDIR="./mqtt"
LOCALSCRIPTDIR=$LOCALDIR/client
BASEURL="https://raw.githubusercontent.com/maletazul/mFi-tools/master/mqtt"

echo "Downloading mFi tools MQTT v4 ..."
wget --no-check-certificate $BASEURL/libmosquitto.so.1?raw=true -O $LOCALDIR/libmosquitto.so.1
wget --no-check-certificate $BASEURL/mosquitto_pub?raw=true -O $LOCALDIR/mosquitto_pub
wget --no-check-certificate $BASEURL/mosquitto_sub?raw=true -O $LOCALDIR/mosquitto_sub
mkdir -p $LOCALSCRIPTDIR

wget --no-check-certificate $BASEURL/client/mqrun.sh -O $LOCALSCRIPTDIR/mqrun.sh
wget --no-check-certificate $BASEURL/client/mqpub-static.sh -O $LOCALSCRIPTDIR/mqpub-static.sh
wget --no-check-certificate $BASEURL/client/mqpub.sh -O $LOCALSCRIPTDIR/mqpub.sh
wget --no-check-certificate $BASEURL/client/mqsub.sh -O $LOCALSCRIPTDIR/mqsub.sh
wget --no-check-certificate $BASEURL/client/mqstop.sh -O $LOCALSCRIPTDIR/mqstop.sh
wget --no-check-certificate $BASEURL/client/mpower-pub.cfg -O $LOCALSCRIPTDIR/mpower-pub.cfg
wget --no-check-certificate $BASEURL/client/mqtt.cfg -O $LOCALSCRIPTDIR/mqtt.cfg

echo "Done downloading"
echo "Please copy the files over to mpower device"
