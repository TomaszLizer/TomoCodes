#!/bin/bash

# Usage: ./video-to-gif.sh input.mp4 output.gif [fps]
INPUT="$1"
OUTPUT="$2"

if [[ -z "$INPUT" || -z "$OUTPUT" ]]; then
  echo "Usage: $0 input.mp4 output.mp4 [fps]"
  exit 1
fi

ffmpeg -i $INPUT \
-vf "fps=10,scale=iw/3:ih/3:flags=lanczos" \
-c:v libx264 \
-crf 32 \
-preset veryslow \
-an $OUTPUT

ffmpeg -i input.jpg -vf "scale=800:-1" -compression_level 6 output.webp