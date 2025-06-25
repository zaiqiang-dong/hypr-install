#!/usr/bin/env bash

cp -r ~/.config/hypr ./config/

if lsmod | grep -q "nvidia"; then
    cp ./config/hypr/gpu.conf ./config/hypr/nvidia.conf
    git checkout ./config/hypr/gpu.conf
fi

git checkout ./config/hypr/workspace.conf
cp -r ~/.config/waybar ./config/
cp -r ~/.config/rofi ./config/
