#!/bin/bash
set -e
read -s -p "MySQL Password: " password
echo "";

echo ""
echo "Setting up main database"
for i in *.sql
do
	echo "---Parsing $i"
	cat $i | mysql -u crashfaster --password=$password crashfaster
done

echo ""
echo "Setting up test database"
for i in *.sql
do
	echo "---Parsing $i"
	cat $i | mysql -u crashfaster --password=$password monobomb_test
done
