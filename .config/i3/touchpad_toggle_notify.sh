#!/bin/sh

device=`xinput | grep 'Touchpad' | head -n 1 | awk '{print $6}' | sed 's/[id=]//g'`
line=`xinput list-props $device | grep 'Device Enabled' | head -n1`
state=$(echo $line | awk '{print $4}')
prop_enabled_id=`echo $line | awk '{print $3}' | sed 's/[(]//g' | sed 's/[):]//g'`


new_state=0
if [ $state -eq 1 ]
then
    $new_state=0
else
    $new_state=1
fi

xinput set-prop $device $prop_enabled_id $new_state
