#!/bin/bash

today=$(date +%R--%d-%m-%Y)
mkdir -p /backup/conf/$today
zip -r /backup/conf/$today/$1.zip $2

