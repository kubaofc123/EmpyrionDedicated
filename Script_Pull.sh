#!/bin/bash

# Load SSH key
eval "$(ssh-agent -s)"
ssh-add "D:\EmpyrionDedicatedServer\ssh_key"

# Pull latest changes
echo "Pulling commits from Github"
cd "D:\EmpyrionDedicatedServer\steamapps\common\Empyrion - Dedicated Server\Saves\Games\DediGame"
git pull

# Remove SSH key
ssh-add -D