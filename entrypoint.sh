#!/bin/bash
set -e

# Überprüfen, ob ein Modus übergeben wurde
MODE=${MODE:-$1}

if [ "$MODE" = "xslt" ]; then
    java -jar /opt/saxon/saxon-he-12.5.jar -s:"$2" -xsl:"$3" -o:"$4"
elif [ "$MODE" = "xquery" ]; then
    java -cp /opt/saxon/saxon-he-12.5.jar net.sf.saxon.Query -q:"$2" -o:"$3"
else
    echo "Invalid mode: $MODE. Use 'xslt' or 'xquery'."
    exit 1
fi