#!/bin/bash

today=$(date +%R--%d-%m-%Y)
mkdir -p /backup/conf/$today
printenv > /backup/conf/$today/env_data.txt