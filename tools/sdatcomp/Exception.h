#ifndef SDATCOMP_EXCEPTION_H
#define SDATCOMP_EXCEPTION_H

#include <string>

namespace sdattool {

    class ArgumentError : public std::exception {
        const char *s;
    public:
        ArgumentError() noexcept;
        ArgumentError(const char *_what) noexcept {s = _what;}
        ArgumentError(const std::string &_what) noexcept {s = _what.c_str();}
        const char *what() const noexcept {return s;}
    };

}

#endif //SDATCOMP_EXCEPTION_H
