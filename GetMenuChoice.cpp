#include <iostream>
using namespace std;


int GetMenuChoice() {
    int choice;
    cout << "\nВыберите вариант:\n";
    cout << "1 - разница кодов ASCII для латинской буквы\n";
    cout << "2 - разница кодов Windows-1251 для русской буквы\n";
    cout << "3 - вывод кода введенной цифры\n";
    cout << "4 - выход\n";
    cout << "Ваш выбор: ";
    cin >> choice;
    return choice;
}

