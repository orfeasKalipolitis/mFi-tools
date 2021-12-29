#!/bin/sh

LOCALDIR="/var/etc/persistent/mqtt"
LOCALSCRIPTDIR=$LOCALDIR/client

echo "Installing mFi tools MQTT v4 ..."

chmod 755 $LOCALDIR/mosquitto_pub
chmod 755 $LOCALDIR/mosquitto_sub
chmod 755 $LOCALSCRIPTDIR/mqrun.sh
chmod 755 $LOCALSCRIPTDIR/mqpub-static.sh
chmod 755 $LOCALSCRIPTDIR/mqpub.sh
chmod 755 $LOCALSCRIPTDIR/mqsub.sh
chmod 755 $LOCALSCRIPTDIR/mqstop.sh

poststart=/etc/persistent/rc.poststart
startscript=$LOCALSCRIPTDIR/mqrun.sh

if [ ! -f $poststart ]; then
    echo "$poststart not found, creating it ..."
    touch $poststart
    echo "#!/bin/sh" >> $poststart
    chmod 755 $poststart
fi

if grep -q "$startscript" "$poststart"; then
   echo "Found $poststart entry. File will not be changed"
else
   echo "Adding start command to $poststart"
   echo "$startscript" >> $poststart
fi

echo "Done installing!"
echo "Please configure $LOCALSCRIPTDIR/mqtt.cfg"
echo "Please configure $LOCALSCRIPTDIR/mpower-pub.cfg"
echo "run 'save' command if done."
