#!/bin/sh
coffee buildr.coffee &&
cd webroot &&
compass compile --force &&
compass compile -e production --force &&
git add css/* &&
git add ccss/* &&
git add cjs/*
