#!/bin/sh
# Builds needed files for debian packaging

FOLD=$(pwd)

DIST="artful"
SECT="main"
EXTR="extra"
ARCH="amd64"
DATE=$(date -u +%Y%m%dT%H%M%S)

set -e

mkdir -p "$FOLD/dest"
cp -R "$FOLD/src/"* "$FOLD/dest/"

# Starting building the needed files
touch "$FOLD/dest/pop_${DIST}-${EXTR}_${ARCH}.yml"

# Construct the header
{
    echo "---"
    echo "File: DEP-11"
    echo "Version: '0.8'"
    echo "Origin: pop-${DIST}-${EXTR}"
    echo "File: DEP-11"
    echo "Priority: 66"
    echo "Time: $DATE"
} > "$FOLD/dest/pop_${DIST}-${EXTR}_${ARCH}.yml"

# Iterate all the files
for file in $(find "$FOLD/src" -type f -name "*.yml"); do
    echo "---" >> "$FOLD/dest/pop_${DIST}-${EXTR}_${ARCH}.yml"
    cat "$file" >> "$FOLD/dest/pop_${DIST}-${EXTR}_${ARCH}.yml"
done

# Compress the yml file to the expected gz file
gzip "$FOLD/dest/pop_${DIST}-${EXTR}_${ARCH}.yml"
