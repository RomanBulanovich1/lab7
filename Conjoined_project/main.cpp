#include "CommandRegistry.h"
#include <windows.h>
#include <iostream>

using namespace std;

void setupConsoleEncoding() {
    SetConsoleCP(1251);
    SetConsoleOutputCP(1251);
}

int main() {
    setupConsoleEncoding();

    while (true) {
        cout << "\n=== МЕНЮ ===\n";
        CommandRegistry::instance().printMenu();
        cout << "0. Выход\nВыбор: ";

        int choice;
        cin >> choice;
        if (choice == 0) break;

        CommandRegistry::instance().execute(choice);
        cin.ignore(); // очистка буфера
    }
    return 0;
}