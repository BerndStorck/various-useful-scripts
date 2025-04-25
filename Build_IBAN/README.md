# mkiban.sh - IBAN-Berechnung

## Language Selection / Sprachauswahl

- [English](#english)
- [Deutsch](#deutsch)

## English - Short Info

'mkiban.sh' is a simple bash script that calculates the IBAN of a German bank account from a given bank code and account number. The script is not built for professional use, although I have checked its calculations, and it tries to prevent some possible errors rooted in incorrect input by the user. All checks of this program are formal; it does not specifically verify whether the given bank code is associated with any German bank, nor does it check if the specified account number exists at the bank identified by the bank code. This script is for private use and may help German users in certain situations. If anyone would like to provide suggestions for improvements or additional code, they are welcome to do so. Feel free to contact me.

### Usage

    mkiban.sh <german_bank_code_number> <bank_account_number>

### Dependencies

Not necessary for basic functionality, but for two advanced features, **mkiban.sh** needs `xclip` and `awk`.

- `xclip` is used to optionally copy the built IBAN to the clipboard.
- `awk` is used to look for the BIC in an optional file that holds some bank code numbers and their corresponding BIC.

### Author

Bernd Storck: I am a certified webmaster/web developer and Linux aficionado from Berlin. I had my first programming experiences around 1984 with an ATARI 800XL. Since then, I've tried or learned many programming languages. I am especially certified as a JavaScript developer, PHP programmer, and web developer. I have extensive experience in Bash programming.

Currently, I use Bodhi Linux as my primary operating system, which has proven to be a reliable foundation for my scripting and personal development projects.

### Contact

* **Facebook-Group:** [Linux mit Bernd Storck](https://www.facebook.com/groups/164934964047448)
* **Facebook-Account:** [Facebook: Linux-Infos von Bernd Storck](https://www.facebook.com/BStLinux/), [www.facebook.com/BStLinux](https://www.facebook.com/BStLinux/)

### License

This program is licensed under the GNU General Public License, version 3 or later.

## Deutsch

**mkiban.sh** ist ein einfaches Bash-Skript, das die IBAN eines deutschen Bankkontos aus der Bankleitzahl und Kontonummer berechnet, die der Anwender dem Skript übergeben hat. 

Die IBAN-Berechnung ist durch Testberechnungen geprüft. Das Skript ist aber nicht für den professionellen Einsatz gedacht, wiewohl es versucht, auch einige fehlerhafte Angaben für BLZ oder Kontonummer abzufangen, die zu einem falschen Rechenergebnis etwa für die Prüfsumme der IBAN führen könnten.
Das Programm kontrolliert die Eingaben – Bankleitzahl und Kontonummer – ausschließlich auf ihre Form, nicht jedoch inhaltlich. Es wird weder überprüft, ob die angegebene Bankleitzahl tatsächlich einer deutschen Bank zugeordnet werden kann, noch ob die angegebene Kontonummer bei dieser Bank existiert.

Dieses Skript habe ich für meinen privaten Gebrauch geschrieben – möglicherweise kann es auch anderen gelegentlich helfen. Verbesserungsvorschläge und zusätzlicher Code sind mir willkommen. Kontaktieren Sie mich oder nutzen Sie die entsprechenden Möglichkeiten über GitHub!

### Verwendung

Rufen Sie das Skript in folgender Form auf:

    mkiban.sh <deutsche_Bankleitzahl> <Kontonummer>

#### Beispiel:

    mkiban.sh 10010010 1234567890

### Abhängigkeiten

Nicht für die Grundfunktion, aber für zwei optionale Zusatzfunktionen benötigt das Skript **mkiban.sh** die Programme `xclip` und `awk`.

- `xclip` kopiert die errechnete IBAN in die Zwischenablage.
- `awk` sucht in einer optionalen Datei, die einige Bankleitzahlen und deren BIC enthält, nach dem BIC.

### Autor

Bernd Storck: Ich bin ein zertifizierter Webmaster/Webentwickler und Linux-Enthusiast aus Berlin. Meine ersten Programmiererfahrungen sammelte ich etwa 1984 mit einem ATARI 800XL. Seitdem habe ich eine Vielzahl von Programmiersprachen ausprobiert und gelernt. Insbesondere bin ich zertifiziert als JavaScript-Entwickler, PHP-Programmierer und Webentwickler. Ich habe umfangreiche Erfahrung in der Bash-Programmierung.

Gegenwärtig verwende ich Bodhi Linux als mein primäres Betriebssystem, das sich als zuverlässige Grundlage für meine Skripte und die persönlichen Entwicklungsvorhaben bewährt hat.

### Kontakt

* **Facebook-Gruppe:** [Linux mit Bernd Storck](https://www.facebook.com/groups/164934964047448)
* **Facebook-Account:** [Facebook: Linux-Infos von Bernd Storck](https://www.facebook.com/BStLinux/), [www.facebook.com/BStLinux](https://www.facebook.com/BStLinux/)

### Lizenz

Dieses Programm steht unter der GNU General Public License, Version 3 oder später.

Die GNU General Public License finden Sie unter <http://www.gnu.org/licenses/>.
