#!/bin/bash

# Load SSH key
eval "$(ssh-agent -s)"
ssh-add "D:\EmpyrionDedicatedServer\ssh_key"

# Pull latest changes
echo "Pulling commits from Github"
git pull

# Remove SSH key
ssh-add -D

# Ask which save to launch
read -p "Select your game save: DedGame(1), Scenariusz2(2): " selected_save
read -p "Update server? (y/n): " update_server    
if [ "$update_server" == "y" ]; then 
    read -p "Validate after update? (y/n):  " validate_update
    
    if [ "$verify_update" == "n" ]; then
        ./steamcmd.exe +login anonymous +app_update 530870 +quit
    fi
    if [ "$verify_update" == "y" ]; then
        ./steamcmd.exe +login anonymous +app_update 530870 validate +quit
    fi
fi

# Start server
echo "Starting server..."
cd "D:\EmpyrionDedicatedServer\steamapps\common\Empyrion - Dedicated Server"
if [ "$selected_save" = 1 ]; then ./MyEmpyrionDedicatedScen1.cmd; fi
if [ "$selected_save" = 2 ]; then ./MyEmpyrionDedicatedScen2.cmd; fi