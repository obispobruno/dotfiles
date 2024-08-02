#!/usr/bin/env bash

mkdir -p ~/Pictures/Screenshots
grim ~/Pictures/Screenshots/$(date +'screenshot_%Y-%m-%d_%H:%M:%S.png')
