#!/bin/bash
set -e
read -s -p "MySQL Password: " password
echo "";

for i in *.sql
do
	echo "---Parsing $i"
	cat $i | mysql -u crashfaster --password=$password crashfaster
done
