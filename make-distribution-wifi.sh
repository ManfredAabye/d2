#!/bin/bash

# Check if exactly one argument is provided
if [ "$#" -ne 1 ]; then
    echo "Usage: make-distribution-wifi.sh <tag>"
    exit 1
fi

# Set directory variables
opensimdir="../diva-distribution"
# opensimdir="../../scratch/diva-wifi-fix-0-7-2/diva-distribution"
# shellcheck disable=SC2034
toolsdir="Tools"
# shellcheck disable=SC2034
libdir="Library"
wd="$(pwd)"

# Get the tag from the argument
cd "$opensimdir" || exit
# tag=`C:/Program\ Files/Git/bin/git show-ref --tags | tail -1`
# tag=`"C:/Program Files (x86)/Git/bin/git" show-ref --tags | tail -1`
tag="$1"
distdir="wifi-$tag"

# Create language satellite assemblies for localization
echo "Generating language files"
cd "$opensimdir/addon-modules/21Wifi/Localization" || exit
./make_languages.sh

# Create distribution directory and start filling it
cd "$wd" || exit
echo "Making Diva Wifi Distribution $distdir"
mkdir "$distdir"
mkdir "$distdir/bin"
cp "$opensimdir/bin/Diva.Data.dll" "$distdir/bin"
cp "$opensimdir/bin/Diva.Data.MySQL.dll" "$distdir/bin"
cp "$opensimdir/bin/Diva.Interfaces.dll" "$distdir/bin"
cp "$opensimdir/bin/Diva.OpenSimServices.dll" "$distdir/bin"
cp "$opensimdir/bin/Diva.Utils.dll" "$distdir/bin"
cp "$opensimdir/bin/Diva.Wifi.dll" "$distdir/bin"
cp "$opensimdir/bin/Diva.Wifi.ScriptEngine.dll" "$distdir/bin"
cp "$opensimdir/addon-modules/Wifi/Wifi.ini.example" "$distdir/bin"
cp -r "$opensimdir/WifiPages" "$distdir"
rm "$distdir/WifiPages/"*~
rm "$distdir/WifiPages/"*/*~

# Copy satellite assemblies for localization
echo "Copying language resource files"
cd "$wd/$opensimdir" || exit
find bin -name "Diva.Wifi.resources.dll" -exec cp --parents {} "$wd/$distdir/" \;

# Copy config, license, and documentation files
echo "Copying config and doc files"
cd "$wd" || exit
mkdir "$distdir/doc"
cp "Configs/READMEWIFI.txt" "$distdir"
cp "Configs/RELEASENOTESWIFI.txt" "$distdir"
cp "Configs/LICENSEWIFI.txt" "$distdir"
cp "Configs/LICENSEIMAGES.txt" "$distdir"

cp "Configs/doc/WIFI.txt" "$distdir/doc"

# Zip the distribution
echo "Zipping..."
chmod +rwx "$distdir" -R
# /c/cygwin/bin/zip -r $distdir.zip $distdir > out
zip -r "$distdir.zip" "$distdir" > out
rm out
