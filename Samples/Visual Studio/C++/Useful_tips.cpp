#include <iostream> // Biblioteka wyjścia/wejścia (odpowiedzialna za instrukcje cout i cin)
#include <ctime> // Biblioteka dostępu do czasu systemowego
#include <vector> // Biblioteka macierzy (takie lepsze tablice)
#include <cstdlib> // Zawiera funkcję rand (pseudolosowość)
#include <windows.h> // Biblioteka systemu windows (zawiera np. okienka systemowe)


using namespace std; // Standardowa przestrzeń nazw (eliminuje wymóg użycia std:: na każdej pozycji)

int main() // Główna funkcja (tutaj się wykonuje aplikacja)
{
	setlocale(LC_ALL, "Polish"); // Ustaw wyświetlanie polskich znaków w konsoli (domyślnie ich nie obsługuje)

	// PSEUDOLOSOWOŚĆ:
	srand(static_cast<unsigned>(time(0))); // Ustawia zależność pobierania liczby od czasu systemowego (efekt pseudolosowości zależnej od milisekund)
	int losowa_liczba = rand() % 50 + 50; // Losuje a następnie zwraca wartości z przedziału: <50; 100>

	// TABLICE DYNAMICZNE:
	int n = 10; // Ustawienie rozmiaru tablicy dynamicznej
    int* tab = new int[n]; // Alokacja dynamiczna
	delete[] tab; // Usunięcie tablicy dynamicznej z pamięci

	// VECTOR:
	vector<int> vectorIntTab; // Ustawianie obiektu tablicy vector.
	vectorIntTab.emplace_back(1); // Dodawanie (nowe miejsce na na końcu) do tablicy wartości 1
	vectorIntTab.emplace_back(2); // Dodawanie (nowe miejsce na na końcu) do tablicy wartości 2
	vectorIntTab.emplace_back(3); // Dodawanie (nowe miejsce na na końcu) do tablicy wartości 3

	cout << "---- Zawartość wektora ----" << endl;

	// PRZYKŁAD - for each vector collection: / Wykonuje się dla każdego elementu kolekcji vector
	for (const auto& v : vectorIntTab)
	{
		cout << v << endl;
	}

	cout << "------------------------" << '\n' << endl;

	// TABLICE WIELOWYMIAROWE:
	int t[4][5]; // Deklaracja tablicy 2D (dwu wymiarowej)

	// PĘTLA WIELOWYMIAROWA:
	for(int i = 0; i < 4/*tab1.size()*/; i++) // Wiersze - i
	{
		for(int j = 0; j < 5/*tab1.size()*/; j++) // Kolumny - j
		{
			t[i][j] = rand()%10; // Wypełnij losowymi od 0 do 9
			cout << t[i][j] << ' '; // Wypisz wiersz (inaczej rekord) i-ty z kolumny j-tej
		}
		cout << '\n'; // Wypisz znak enter (następna linijka)
	}

	return 0; // zwróć zero - 0 / Domyślna, poprawna, bezbłędna procedura zamknięcia programu.
	// W przypadku błędu zwraca się wartość jeden - 1
}
