echo "" > uBlacklist.txt
while read p; do
  echo "Processing file at $p"
  curl $p >> uBlacklist.txt
done < sources.txt

echo Done