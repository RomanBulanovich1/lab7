#pragma once
#include <iostream>
#include <map>
#include <string>
#include <functional>

using namespace std;

using CommandFunc = function<void()>;

class CommandRegistry {
public:
    static CommandRegistry& instance() {
        static CommandRegistry inst;
        return inst;
    }

    void registerCommand(int id, const string& name, CommandFunc func) {
        commands[id] = func;
        commandNames[id] = name;
    }

    void execute(int id) const {
        auto it = commands.find(id);
        if (it != commands.end())
            it->second();
        else
            cout << "Неверный выбор.\n";
    }

    void printMenu() const {
        for (auto it = commandNames.begin(); it != commandNames.end(); ++it) {
            cout << it->first << ". " << it->second << "\n";
        }
    }

private:
    map<int, CommandFunc> commands;
    map<int, string> commandNames;
};

#define REGISTER_COMMAND(id, name, func) \
    namespace { \
        struct Registrar_##func { \
            Registrar_##func() { \
                CommandRegistry::instance().registerCommand(id, name, func); \
            } \
        }; \
        static Registrar_##func global_registrar_##func; \
    }