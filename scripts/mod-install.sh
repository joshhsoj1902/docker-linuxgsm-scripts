#!/bin/bash

# Will install all mods in a comma delimited list from LGSM_HELPER_MODS

IFS=,
set -f
for i in $LGSM_HELPER_MODS; do
    echo "Installing mod ${i}"
    echo -e "${i}\nY" | /app/"${GAMESERVER}" mods-install
done
