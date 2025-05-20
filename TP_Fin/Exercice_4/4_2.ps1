# Équivalent Unix/Linux (bash) :
for file in "$SRC"/*; do
dest="$DST/$(basename "$file")"
[ ! -e "$dest" ] || [ "$file" -nt "$dest" ] && cp "$file" "$dest"
done
