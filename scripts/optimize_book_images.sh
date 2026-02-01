#!/usr/bin/env bash
set -euo pipefail

if [[ ${1:-} == "" || ${1:-} == "-h" || ${1:-} == "--help" ]]; then
  echo "Usage: scripts/optimize_book_images.sh <book-folder> [--delete]"
  echo "Example: scripts/optimize_book_images.sh books/321_Peter_and_the_Wolf --delete"
  exit 0
fi

book_dir="$1"
delete_after="${2:-}"

if [[ ! -d "$book_dir" ]]; then
  echo "Error: folder not found: $book_dir" >&2
  exit 1
fi

scan_count=0

while IFS= read -r -d '' scan; do
  out="${scan%.png}.jpg"
  sips -s format jpeg -s formatOptions 70 "$scan" --out "$out" >/dev/null
  ((scan_count+=1))
  if [[ "$delete_after" == "--delete" ]]; then
    rm -f "$scan"
  fi
done < <(find "$book_dir" -maxdepth 1 -type f -name 'Scan *.png' -print0)

cover_png="$book_dir/cover.png"
if [[ -f "$cover_png" ]]; then
  sips -s format jpeg -s formatOptions 85 "$cover_png" --out "${book_dir}/cover.jpg" >/dev/null
  if [[ "$delete_after" == "--delete" ]]; then
    rm -f "$cover_png"
  fi
fi

echo "Converted $scan_count scans in $book_dir."
echo "If your page uses .png in HTML/JS, update it to .jpg."
