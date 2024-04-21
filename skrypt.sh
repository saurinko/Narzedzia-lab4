#!/bin/bash 
pokaz_date(){
	date  # To wywołuje polecenie date, które zwraca aktualną datę i godzinę.
}
stworz_logi(){
	local num_logs=${1:-100}
	for ((i=1; i<=$num_logs; i++)) do
		plik="log$i.txt"
		echo "Nazwa pliku: $plik" > "$plik"
		echo "Nazwa skryptu: skrypt.sh" >> "$plik"
		echo "Data: $(date)" >> "$plik"
	done
	echo "Utworzono $num_logs plików logów."
}
uzycie_help(){
	echo "Użycie: skrypt.sh - co można zrobić:"
	echo "help            - Wyświetla pomoc"
	echo "--date          - Wyświetla dzisiejszą datę"
	echo "--logs <liczba> - Tworzy <liczba> plików logów. Domyślnie 100."
}
case "$1" in
	"--date")
		pokaz_date
		;;
	"--logs")
		stworz_logi "$2"
		;;
	"--help")
		uzycie_help
		;;
	*)
		echo "Nieznane polecenie: $1. Wpisz 'skrypt.sh help', jeśli nie wiesz, co zrobić."
		exit 1
		;;
esac
exit 0
