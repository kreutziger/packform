#!/bin/bash

INPUT=$(cat)

FILE=$(echo "$INPUT" | jq -r '.file')
CONTENT=$(echo "$INPUT" | jq -r '.content')

echo "$CONTENT" > "$FILE"

echo '{}'
