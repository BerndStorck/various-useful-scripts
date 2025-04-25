#!/usr/bin/env bash
#
# mkiban.sh
# Version: 1.0.0
#
# Project Description:
#    de: Das Skript berechnet die IBAN zu einer beim Aufruf übergebenen Bankleitzahl und Kontonummer.
#        Optional kopiert es das Ergebnis in die Zwischenablage und ermittelt die BIC.
#    en: This script generates the IBAN from a given bank code and account number at runtime.
#        Optionally, it copies the IBAN to the clipboard and determines the BIC.
#
# Usage:
#   mkiban.sh <german_bank_code_number> <bank_account_number>
#
# Dependencies for additional features:
#   - xclip
#   - awk
#
# Author:    Bernd Storck
# Contact:   https://www.facebook.com/BStLinux/
#
# History:  2025-04-25
#
# Copyright: 2025, Bernd Storck
# License:   GNU General Public License 3.0
#

# set -x

BIC_FILE="bic_list.txt"

BLZ="$1"
KONTO="$2"
LAND="DE"

usage () {
    echo "Verwendung: $0 <BLZ> <Kontonummer>"
    exit 1
}

get_human_readable_IBAN () {
# Formatierte IBAN-Ausgabe
    echo "$(echo "$1" | sed -E 's/(.{4})/\1 /g')"
}

# Ueberpruefen, ob zwei Argumente uebergeben wurden (BLZ und Kontonummer)
if [ "$#" -ne 2 ]; then
    usage
elif [ "${#BLZ}" -ne 8 ]; then
    echo "FEHLER: Der angebene Wert für die Bankleitzahl muss 8 Zeichen lang sein!" > /dev/stderr
    printf "%8s (Ihre Eingabe)\n" "$BLZ " > /dev/stderr
    echo " ' ' ' |" > /dev/stderr
    echo "12345678" > /dev/stderr
    echo  > /dev/stderr
    usage
fi    

# Setzt vor die Kontonummer Nullen, bis sie 10 Zeichen lang ist.
# Das ist noetig, damit fuer 'CHECKSUM' der richtige Wert berechnet wird.
if [ "${#KONTO}" -lt 10 ]; then
    KONTO="$(printf "%010d" "$KONTO")"
fi

# Deutsche IBAN hat immer 22 Zeichen, der Laender-Code ist 'DE' (Deutschland)
BANKNUMMER="${BLZ}${KONTO}"

# Umwandlung des Laender-Codes in Zahlen: D = 13, E = 14
# Anmerkung: IBAN_RW entspricht Banknummer plus der Zahlen fuer D und E
IBAN_RAW_NUMERIC="${BANKNUMMER}131400"

# Berechnung der Pruefziffer gemaess MOD 97-10
# CHECKSUM=$(( 98 - (${IBAN_RAW//0/} % 97) ))
# CHECKSUM=$(echo "98 - (${IBAN_RAW_NUMERIC} % 97)" | bc)
CHECKSUM=$(bc <<< "98 - (${IBAN_RAW_NUMERIC} % 97)")

# Formatierung der Pruefziffer (zweistellig)
CHECKSUM=$(printf "%02d" "$CHECKSUM")

# Erstellung der endgueltigen IBAN
IBAN="${LAND}${CHECKSUM}${BANKNUMMER}"

human_readable_IBAN="$(get_human_readable_IBAN "$IBAN")"

# Die IBAN in die Zwischenablage kopieren (fuer Linux):
if command -v xclip >/dev/null 2>&1; then
    xclip -silent -selection clipboard <<< "$IBAN" 
    echo "Generierte IBAN: $human_readable_IBAN"
    echo "Die IBAN \"$IBAN\" wurde in die Zwischenablage kopiert." > /dev/stderr
else
    printf "%-18s %s\n" "Generierte IBAN:" "$human_readable_IBAN"
    printf "%-18s %s\n" "IBAN zum Kopieren:" "$IBAN"
fi

# BIC ermitteln:
case "$BLZ" in 
    10010010)  echo -e "\nBIC: PBNKDEFFXXX" ;;
    # Dupliziere die vorherige Zeile und setze die Bankleitzahl und BIC Deiner Bank ein!
    *)
    if [ -f "$BIC_FILE" ]; then
        awk -F ',' -v targetBLZ="$BLZ" '
        BEGIN { found=0 }
        {
            if ( $2 == targetBLZ ) {
                print "\nBIC:", $3;
                found=1;
                exit;
            }
        }
        END {
            if (found == 0) {
                print "\nKeine BIC gefunden fuer BLZ " targetBLZ > /dev/stderr;
            }
        }' "$BIC_FILE"
    fi
    ;;
esac
