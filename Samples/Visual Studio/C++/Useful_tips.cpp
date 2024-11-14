#include <iostream>
#include <time.h>
#include <vector>

using namespace std;

int main()
{
	setlocale(LC_ALL, "Polish");
	srand(static_cast<unsigned>(time(0)));

	int i = rand() % 50 + 50; // Return values: <50; 100>

	vector<int> vectorIntTab;

	vectorIntTab.emplace_back(1);
	vectorIntTab.emplace_back(2);
	vectorIntTab.emplace_back(3);

	cout << "---- Write each one ----" << endl;

	// for each vector collection
	for (const auto& v : vectorIntTab)
	{
		cout << v << endl;
	}

	cout << "------------------------" << endl << endl;

	cout << "Hello world " << "!" << '\n';

	return 0;
}
