unencrypted_pdf=$(basename "$1" .pdf)_unenc.pdf
gs -q -dNOPAUSE -dBATCH -sDEVICE=pdfwrite -sOutputFile="$unencrypted_pdf" -c .setpdfwrite -f "$1" 
