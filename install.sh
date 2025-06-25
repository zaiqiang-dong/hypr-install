#!/bin/bash
# https://github.com/JaKooLit

# Function to execute a script if it exists and make it executable

script_directory=scripts
execute_script() {
    local script="$1"
    local script_path="$script_directory/$script"
    if [ -f "$script_path" ]; then
        chmod +x "$script_path"
        if [ -x "$script_path" ]; then
            env "$script_path"
        else
            echo "Failed to make script '$script' executable." | tee -a "$LOG"
        fi
    else
        echo "Script '$script' not found in '$script_directory'." | tee -a "$LOG"
    fi
}

# execute pre clean up
execute_script "00-dependencies.sh"
sleep 1
execute_script "01-hypr-pkgs.sh"
sleep 1
execute_script "hyprlang.sh"
sleep 1
execute_script "hyprland.sh"
sleep 1
execute_script "rofi-wayland.sh"
sleep 1
execute_script "hyprlock.sh"
sleep 1
execute_script "hypridle.sh"
sleep 1

if lspci -k | grep -A 2 -E "(VGA|3D)" | grep -qi "nvidia"; then
    echo "use nvidia gpu"
    execute_script "nvidia.sh"
    cp ./config/hypr/nvidia.conf ./config/hypr/gpu.conf
    sleep 1
fi


wayland_sessions_dir=/usr/share/wayland-sessions
[ ! -d "$wayland_sessions_dir" ] && { printf "$CAT - $wayland_sessions_dir not found, creating...\n"; sudo mkdir -p "$wayland_sessions_dir" 2>&1 | tee -a "$LOG"; }
sudo cp assets/hyprland.desktop "$wayland_sessions_dir/" 2>&1

# copy config
cp -r ./config/* ~/.config/


# clean
git checkout ./config/hypr/gpu.conf
rm ./Install-Logs -rf
rm ./hyprlang -rf
rm ./rofi-* -rf
rm ./hyprlock -rf
rm ./Hyprland -rf
