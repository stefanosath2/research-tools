#!/usr/bin/env bash
# compress_pdf.sh
# Uses Ghostscript to create a smaller, screen-optimised PDF
# Usage: ./compress_pdf.sh input.pdf output.pdf
set -e # exit if installation fails

gs -sDEVICE=pdfwrite \
	-dCompatibilityLevel=1.4 \
	-dPDFSETTINGS=/screen \
	-dNOPAUSE -dQUIET -dBATCH \
	-sOutputFile="$2" "$1"

