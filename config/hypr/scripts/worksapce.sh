#!/bin/bash
MONITOR_NAME=$(hyprctl monitors | grep "ID 0"  | cut -d " " -f 2)

# 写入临时配置文件
echo "workspace = 1, monitor:$MONITOR_NAME" > ~/.config/hypr/workspace.conf
echo "workspace = 2, monitor:$MONITOR_NAME" >> ~/.config/hypr/workspace.conf
echo "workspace = 3, monitor:$MONITOR_NAME" >> ~/.config/hypr/workspace.conf
echo "workspace = 4, monitor:$MONITOR_NAME" >> ~/.config/hypr/workspace.conf
echo "workspace = 5, monitor:$MONITOR_NAME" >> ~/.config/hypr/workspace.conf


MONITOR_NAME=$(hyprctl monitors | grep "ID 1"  | cut -d " " -f 2)
echo "workspace = 6, monitor:$MONITOR_NAME" >> ~/.config/hypr/workspace.conf
echo "workspace = 7, monitor:$MONITOR_NAME" >> ~/.config/hypr/workspace.conf
echo "workspace = 8, monitor:$MONITOR_NAME" >> ~/.config/hypr/workspace.conf
echo "workspace = 9, monitor:$MONITOR_NAME" >> ~/.config/hypr/workspace.conf
echo "workspace = 10, monitor:$MONITOR_NAME" >> ~/.config/hypr/workspace.conf
echo "workspace = 11, monitor:$MONITOR_NAME" >> ~/.config/hypr/workspace.conf
