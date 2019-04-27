#!/bin/bash

echo 'Checking for a new Java Version...'
kern_arch=$(uname -r | sed 's/.*-\(.*\)/\1/')
if [ "$kern_arch" = amd64 ]; then
    java_ver=' x64 RPM'
fi
current_version=$(java -version 2>&1 >/dev/null | sed -n '1s/.*"\([^"]*\)"/\1/p')
latest_version_url=$(curl https://www.java.com/en/download/manual.jsp 2>/dev/null | grep -Po -m 1 "href=\"\K[^\"]*(?=.*Linux${java_ver} en JRE)"
AVAILABLE=$(echo ${latest_version_url} | grep -o -P 'jdk-8u.{0,2}' | cut -d "u" -f 2)
)
latest_version=$(curl $latest_version_url 2>/dev/null | sed -n 's/.*File=jre-\([0-9]\)u\([0-9]\{2\}\).*/1.\1.0_\2/p')
if [ "$current_version" = "$latest_version" ]; then
    echo 'No new Java version available. Aborting.'
    exit 1
fi
read -n 1 -p "A new Java version is available (${latest_version})! Would you like to download it (y)? " download
echo
if [ "$download" = y ]; then
    filename="$(curl "$latest_version_url" 2> /dev/null | sed -n 's/.*File=\([^&]*\).*/\1/p')"
    wget -q -O "$filename" --show-progress "$latest_version_url"
    echo 'Download completed.'
    echo "Unzip the downloaded Java ${latest_version}" of file "${filename}"
    sudo mkdir /usr/java/
    tar -xzf "${filename}" -C /usr/java/
    installation_path=$(ls /usr/java/)
    echo "Java is unzipped and installed in /usr/java/${installation_path}"
fi
exit