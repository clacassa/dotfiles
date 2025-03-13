#! /bin/sh

# Touchpad configuration for i3
# Enables tapping as click and natural scrolling
# Sets the acceleration to 0.5 (default is 0)

touchpad_id=`xinput | grep 'Touchpad' | head -n 1 | awk '{print $6}' | sed 's/[id=]//g'`
prop_tap_id=`xinput list-props $touchpad_id | grep 'Tapping Enabled' | head -n 1 | awk '{print $4}' | sed 's/[(]//g' | sed 's/[):]//g'`
prop_nat_scrol_id=`xinput list-props $touchpad_id | grep 'Natural' | head -n 1 | awk '{print $5}' | sed 's/[(]//g' | sed 's/[):]//g'`
prop_accel_spd_id=`xinput list-props $touchpad_id | grep 'Accel' | head -n 1 | awk '{print $4}' | sed 's/[(]//g' | sed 's/[):]//g'`

xinput set-prop $touchpad_id $prop_tap_id 1
xinput set-prop $touchpad_id $prop_nat_scrol_id 1
xinput set-prop $touchpad_id $prop_accel_spd_id 0
