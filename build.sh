#!/bin/sh
coffee buildr.coffee &&
cd webroot &&
compass compile -e production --force &&
git add webroot/ccss/* &&
git add webroot/cjs/*
