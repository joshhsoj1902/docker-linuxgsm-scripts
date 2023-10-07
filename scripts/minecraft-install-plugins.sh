#!/bin/bash

installMode=${1:-true}

PluginDir=/data/serverfiles/plugins
DownloadDir=/app/mc-plugins

function doInstall {
    if [ $installMode == true ]; then
        echo "Installing $1"
        cp -p $DownloadDir/$1 $PluginDir
    fi
}

# Dynmap. The requred ENV vars are:
# - LGSM_MINECRAFT_PLUGIN_DYNMAP_VERSION_ID
# - LGSM_MINECRAFT_PLUGIN_DYNMAP_VERSION
# both are found in the download URL here: https://modrinth.com/plugin/dynmap/versions
if [ -n "$LGSM_MINECRAFT_PLUGIN_DYNMAP_VERSION_ID" ] && [ -n "$LGSM_MINECRAFT_PLUGIN_DYNMAP_VERSION" ]; then
    echo "=== Start Dynmap ==="
    OutputFile=$LGSM_MINECRAFT_PLUGIN_DYNMAP_VERSION
    if [ ! -f $DownloadDir/$OutputFile ]; then
        echo "Plugin missing, Downloading"
        curl -o $DownloadDir/$OutputFile https://cdn.modrinth.com/data/fRQREgAc/versions/$LGSM_MINECRAFT_PLUGIN_DYNMAP_VERSION_ID/$LGSM_MINECRAFT_PLUGIN_DYNMAP_VERSION
    fi

    doInstall $OutputFile

    echo "=== Done Dynmap"
fi

if [ -n "$LGSM_MINECRAFT_PLUGIN_ESSENTIALS_VERSION" ]; then
    echo "=== Start EssentialsX ==="
    OutputFile="EssentialsX-$Version.jar"
    if [ ! -f $DownloadDir/$OutputFile ]; then
        echo "Plugin missing, Downloading"
        curl -o $DownloadDir/$OutputFile https://github.com/EssentialsX/Essentials/releases/download/$Version/EssentialsX-$Version.jar
    fi

    doInstall $OutputFile

    echo "=== Done EssentialsX"
fi

if [ -n "$LGSM_MINECRAFT_PLUGIN_UNIFIED_METRICS_VERSION" ]; then
    echo "=== Start Unified metrics ==="
    OutputFile="unifiedmetrics-platform-bukkit-$Version.jar"
    if [ ! -f $DownloadDir/$OutputFile ]; then
        echo "Plugin missing, Downloading"
        curl -o $DownloadDir/$OutputFile https://github.com/Cubxity/UnifiedMetrics/releases/download/$Version/unifiedmetrics-platform-bukkit-$Version.jar
    fi
    doInstall $OutputFile

    echo "=== Done Unified metrics"
fi
