#!/bin/bash

has_empty_newline() {
    [[ $(tail -c 2 "$1") == $'\n' ]]
}

list_files_without_empty_newline() {
    local directory=$1
    find "$directory" -type f -not -path "*/node_modules/*" -print0 | while IFS= read -r -d '' file; do
        if has_empty_newline "$file"; then
            echo "$file"
        fi
    done
}

if [ $# -lt 1 ]; then
    echo "Usage: $0 <directory>"
    exit 1
fi

directory=$1
list_files_without_empty_newline "$directory"

