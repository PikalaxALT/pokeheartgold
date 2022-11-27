#ifndef GUARD_OPTIONS_H
#define GUARD_OPTIONS_H
#include <iostream>
#include <string>
#include <cstring>
#include "NtrRom.h"

enum ExecMode {
    EXEC_DECRY = 0,
    EXEC_ENCRY = 1,
    EXEC_HELP = 2,
};

struct Options {
    Options(int argc, char ** argv) {};
    virtual ~Options() = default;
    virtual int main() = 0;
    static ExecMode TranslateExecMode(std::string const& value) {
        ExecMode mode;
        if (value == "decry") {
            mode = EXEC_DECRY;
        } else if (value == "encry") {
            mode = EXEC_ENCRY;
        } else if (value == "help" || value == "-h" || value == "--help") {
            mode = EXEC_HELP;
        } else {
            throw std::invalid_argument(std::string("invalid ExecMode value: expected 'encry' or 'decry'; got ") + value);
        }
        return mode;
    }
};

#endif //GUARD_OPTIONS_H
