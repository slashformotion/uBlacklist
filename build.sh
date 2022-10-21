#!/bin/bash

target="uBlacklist.txt"
rm -f $target
touch $target
while read p; do
  echo "Processing file at $p"
  curl $p >> ${target}
done < sources.txt

echo "Appending my personal list"
cat personalList.txt >> ${target}

echo Done