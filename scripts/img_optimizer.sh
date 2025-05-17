#!/bin/bash

# Usage: ./video-to-gif.sh input.mp4 output.gif [fps]
INPUT="$1"
OUTPUT="$2"
WIDTH="${3:-800}"
COMPRESSION="${4:-6}"

if [[ -z "$INPUT" || -z "$OUTPUT" ]]; then
  echo "Usage: $0 input.png output.webp [width] [compression_level]"
  exit 1
fi

ffmpeg -i "$INPUT" -vf "scale=$WIDTH:-1" -compression_level $COMPRESSION "$OUTPUT"
