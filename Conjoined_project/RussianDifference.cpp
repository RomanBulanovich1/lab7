#include "CommandRegistry.h"
#include <iostream>
#include <string>

using namespace std;

void handleRussianDifference() {
    cout << "Введите строку из русских символов: ";
    string s;
    getline(cin, s);

    for (char c : s) {
        unsigned char u = c;
        bool isRussian = (u >= 192 && u <= 223) || (u >= 224 && u <= 255);
        if (isRussian) {
            cout << "'" << c << "' разница (между А и а) = 32" << endl;
        }
        else {
            cout << "Символ '" << c << "' не является русской буквой в CP1251\n";
        }
    }
}

REGISTER_COMMAND(2, "Разница CP1251 (русские буквы)", handleRussianDifference);