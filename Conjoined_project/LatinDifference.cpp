#include "CommandRegistry.h"
#include <iostream>
#include <string>
#include <cstdlib>

using namespace std;

void handleLatinDifference() {
    cout << "Введите строку из латинских символов: ";
    string s;
    getline(cin, s);

    for (char c : s) {
        if ((c >= 'a' && c <= 'z') || (c >= 'A' && c <= 'Z')) {
            int diff = abs(c - tolower(c));
            cout << "'" << c << "' разница = " << diff << endl;
        }
        else {
            cout << "Символ '" << c << "' не является латинской буквой\n";
        }
    }
}

REGISTER_COMMAND(1, "Разница ASCII (латиница)", handleLatinDifference);