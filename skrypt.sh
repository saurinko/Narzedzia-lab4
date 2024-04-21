#!/bin/bash 
pokaz_date(){
	date  # To wywołuje polecenie date, które zwraca aktualną datę i godzinę.
}
case "$1" in
	"--date")
		pokaz_date
		;;
	*)
		echo "Nieznane polecenie: $1. Wpisz 'skrypt.sh help', jeśli nie wiesz, co zrobić."
		exit 1
		;;
esac
exit 0
