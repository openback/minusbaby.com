#!/bin/sh
coffee buildr.coffee &&
cd webroot &&
compass compile -e production --force &&
git add ccss/* &&
git add cjs/*
