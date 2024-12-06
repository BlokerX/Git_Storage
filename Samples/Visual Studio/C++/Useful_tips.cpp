#include <iostream>
#include <ctime>
#include <vector>

using namespace std;

int main()
{
	setlocale(LC_ALL, "Polish");

	// PSEUDOLOSOWOŚĆ:
	srand(static_cast<unsigned>(time(0)));
	int losowa_liczba = rand() % 50 + 50; // Return values: <50; 100>

	// TABLICE DYNAMICZNE:
	int n = 10; // Ustawienie rozmiaru tablicy dynamicznej
    int* tab = new int[n]; // Alokacja dynamiczna
	delete[] tab; // Usunięcie tablicy dynamicznej z pamięci

	// VECTOR:
	vector<int> vectorIntTab;
	vectorIntTab.emplace_back(1);
	vectorIntTab.emplace_back(2);
	vectorIntTab.emplace_back(3);

	cout << "---- Zawartość wektora ----" << endl;

	// PRZYKŁAD - for each vector collection:
	for (const auto& v : vectorIntTab)
	{
		cout << v << endl;
	}

	cout << "------------------------" << '\n' << endl;

	// TABLICE WIELOWYMIAROWE:
	int t[4][5]; // Deklaracja tablicy 2D

	// PĘTLA WIELOWYMIAROWA:
	for(int i = 0; i < 4/*tab1.size()*/; i++) // Wiersze - i
	{
		for(int j = 0; j < 5/*tab1.size()*/; j++) // Kolumny - j
		{
			t[i][j] = rand()%10; // Wypełnij losowymi od 0 do 9
			cout << t[i][j] << ' ';
		}
		cout << '\n';
	}

	return 0;
}
