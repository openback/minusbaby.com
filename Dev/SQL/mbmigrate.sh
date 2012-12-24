#!/bin/bash
set -e
read -s -p "MySQL Password: " password
echo "";

echo ""
echo "Setting up main database"
for i in [0-9]*.sql
do
	echo "---Parsing $i"
	cat $i | mysql -u db43752_minusbby --password=$password db43752_minusbaby_cake2
done

echo ""
echo "Setting up test database"
for i in [0-9]*.sql
do
	echo "---Parsing $i"
	cat $i | mysql -u crashfaster --password=$password monobomb_test
done
