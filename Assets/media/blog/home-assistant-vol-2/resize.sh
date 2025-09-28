#!/usr/bin/env bash
set -euo pipefail

# Usage:
#   ./process_images.sh INPUT_DIR OUTPUT_DIR CROP_W CROP_H [NAME_REGEX]
# Examples:
#   ./process_images.sh ./in ./out 800 600               # crop ALL
#   ./process_images.sh ./in ./out 800 600 "screenshot"  # crop only names matching regex

INPUT_DIR="${1:?INPUT_DIR required}"
OUTPUT_DIR="${2:?OUTPUT_DIR required}"
shift 2   # <--- remove INPUT_DIR & OUTPUT_DIR from arguments

while [[ $# -gt 0 ]]; do
  case "$1" in
    --crop)
      [[ "$2" =~ ^([0-9]+)x([0-9]+)$ ]] || { echo "Crop must be WIDTHxHEIGHT"; exit 1; }
      CROP_W="${BASH_REMATCH[1]}"
      CROP_H="${BASH_REMATCH[2]}"
      shift 2;;
    --regex)
      NAME_REGEX="$2"; shift 2;;
    *)
      echo "Unknown arg: $1"; exit 1;;
  esac
done

 # yuva420p - alpha, yuv420p - no alpha
 # yuv444p - no alpha, better quality
FORMAT="yuva420p"
COMPRESSION_LEVEL=6
QUALITY=80

mkdir -p "$OUTPUT_DIR"

shopt -s nullglob

# Restrict to common image extensions; add more if you’d like
for img in "$INPUT_DIR"/*.{png,PNG,jpg,JPG,jpeg,JPEG,bmp,BMP,gif,GIF,webp,WEBP}; do
  filename="$(basename "$img")"
  out="$OUTPUT_DIR/${filename%.*}.webp"
  # Decide whether to crop this file
  DO_CROP=0

  # Only enable crop if crop params were given
  if [[ -n "${CROP_W:-}" && -n "${CROP_H:-}" ]]; then
    if [[ -n "${NAME_REGEX:-}" ]]; then
      # Crop only if filename matches regex
      if [[ "$filename" =~ $NAME_REGEX ]]; then
        DO_CROP=1
      fi
    else
      # No regex provided -> crop all files
      DO_CROP=1
    fi
  fi

  if (( DO_CROP )); then
    # Get dimensions in a portable way (no process substitution)
    dim="$(ffprobe -v error -select_streams v:0 \
           -show_entries stream=width,height -of csv=p=0:s=x "$img" || true)"

    if [[ -z "$dim" ]]; then
      echo "Skipping (no video/image stream?): $filename"
      continue
    fi

    WIDTH="${dim%x*}"
    HEIGHT="${dim#*x}"

    # Clamp crop size to image bounds (prevents negatives if image is smaller)
    CW=$(( CROP_W > WIDTH  ? WIDTH  : CROP_W ))
    CH=$(( CROP_H > HEIGHT ? HEIGHT : CROP_H ))

    X=$(( (WIDTH  - CW) / 2 ))
    Y=$(( (HEIGHT - CH) / 2 ))

    echo "Cropping & converting: $filename  (${WIDTH}x${HEIGHT} -> ${CW}x${CH})"
    ffmpeg -y -i "$img" \
      -vf "crop=${CW}:${CH}:${X}:${Y},format=${FORMAT}" \
      -c:v libwebp -q:v ${QUALITY} -compression_level ${COMPRESSION_LEVEL} \
      "$out"
  else
    echo "Converting without crop: $filename"
    ffmpeg -y -i "$img" \
      -vf "format=${FORMAT}" \
      -c:v libwebp -q:v ${QUALITY} -compression_level ${COMPRESSION_LEVEL} \
      "$out"
  fi
done