#!/bin/bash

## VARS for usage
ORG_ID=1
FILE_NAME=hosts.file

echo "Removing old ansible hosts file"
rm -f $FILE_NAME

echo "Creating ansible inventory with using hammer"
for a in `hammer activation-key list --organization-id $ORG_ID --fields name | grep -v NAME | grep -v "-"`
do
  echo "creating entry for key $a"
  echo [$a] >> $FILE_NAME
  echo "Addresses to be added:"
  hammer host list --search activation_key=$a --fields ip | grep -v IP | grep -v "-"
  hammer host list --search activation_key=$a --fields ip | grep -v IP | grep -v "-" >> $FILE_NAME
done
echo "Please check hosts.file for any errors in IP-address"
