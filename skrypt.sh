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
	echo "help             -h   Wyświetla pomoc"
	echo "--date           -d   Wyświetla dzisiejszą datę"
	echo "--logs <liczba>  -l   Tworzy <liczba> plików logów. Domyślnie 100."
}
case "$1" in
	"--date" | "-d")
		pokaz_date
		;;
	"--logs" | "-l")
		stworz_logi "$2"
		;;
	"--help" | "-h")
		uzycie_help
		;;
	*)
		echo "Nieznane polecenie: $1. Wpisz 'skrypt.sh help', jeśli nie wiesz, co zrobić."
		exit 1
		;;
esac
exit 0
