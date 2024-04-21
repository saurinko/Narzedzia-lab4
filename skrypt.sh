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
	echo "--init           -i   Klonuje całe repozytorium do katalogu, w którym został uruchomiony oraz ustawia ścieżkę w zmiennej środowiskowej PATH."
	echo "--error <liczba> -e   Tworzt <liczba> plików błędów. Domyślnie 100."
}
klonowanie_repo(){
	git clone
	aktualna_sciezka=$(pwd)
	export PATH="$aktualna_sciezka/.git:$PATH"
	echo "Repozytorium zostało sklonowane, a ścieżka dodana do zmiennej PATH."
}
stworz_error(){
	local num_error=${1:-100}
	for ((i=1; i<=$num_error; i++)); do
		plik="error$i.txt"
		echo "To plik błędu numer $i." > "plik"
	done
	echo "Utworzono $num_error plików błędów."
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
	"--init" | "-i")
		klonowanie_repo
		;;
	"--error" | "-e")
		stworz_error
		;;
	*)
		echo "Nieznane polecenie: $1. Wpisz 'skrypt.sh help', jeśli nie wiesz, co zrobić."
		exit 1
		;;
esac
exit 0
