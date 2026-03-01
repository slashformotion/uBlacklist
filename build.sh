#!/bin/bash

target="uBlacklist.txt"
rm -f $target
touch $target
echo "Starting to pull from sources.txt"
while read -r p; do
  echo "Processing file at $p"
  curl "$p" >> ${target}
done < sources.txt

echo "Appending my personal list"
cat personalList.txt >> ${target}

echo "Removing duplicates and comments"
sort -u ${target} | grep -v '^#' | grep -v '^$' > ${target}.tmp
mv ${target}.tmp ${target}

echo "Done"
