items=(`find . -name '*lua'`)
for item in "${items[@]}"; do
  echo "$item"
done
