#!/bin/bash

# Stage changes
echo "Staging files..."
cd "D:\EmpyrionDedicatedServer\steamapps\common\Empyrion - Dedicated Server\Saves\Games\DediGame"
git add .

# Load SSH key
eval "$(ssh-agent -s)"
ssh-add "D:\EmpyrionDedicatedServer\ssh_key"

# Send files
git commit -m "Changes by Kuba"
git push

# Remove SSH key
ssh-add -D

# Wait for user input before exiting
read -p "Press enter to exit"