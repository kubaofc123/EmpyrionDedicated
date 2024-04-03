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
read -p "Select your game save: DedGame(1), Scenariusz2(2)" selected_save

# Start server
echo "Starting server..."
cd "D:\EmpyrionDedicatedServer\steamapps\common\Empyrion - Dedicated Server"
if [ "$selected_save" = 1 ]; then ./MyEmpyrionDedicatedScen1.cmd; fi
if [ "$selected_save" = 2 ]; then ./MyEmpyrionDedicatedScen2.cmd; fi