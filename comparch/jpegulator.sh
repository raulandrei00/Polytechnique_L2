
if test ! -n "$1" || test ! -n "$2" || test ! $# -lt 3; then 
    exit 1
fi

if [ ! -d "$1" ]; then
    echo "cannot find directory $1"
    exit 1
fi

if [ -d "$2" ]; then
    echo "directory $2 already exists"
    exit 1
fi

mkdir -p "$2"


find . -type f -iregex ".*/$1/.*\.jpg" | while IFS= read -r file; do
    echo "Processing $file"
    filename=$(basename "$file")

    timestampLine=$( exiv2 pr "$file" | grep "Image timestamp" | cut -d':' -f2 | sed 's/^ *//')
    # echo ${#timestampLine}
    if [ -n "$timestampLine" ]; then
        
        mkdir -p "$2/$timestampLine"
        cp "$file" "$2/$timestampLine/$filename"
    
    else 
        echo "cannot find timestamp for $file"
    fi
done


