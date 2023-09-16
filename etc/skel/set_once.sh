#!/bin/sh
dbus-launch dconf load / < ~/xed.dconf
rm ~/xed.dconf ~/set_once.sh
