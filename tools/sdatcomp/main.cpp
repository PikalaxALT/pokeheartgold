#include <iostream>
#include <vector>
#include <stdexcept>
#include "Options.h"
#include "Exception.h"

int main(int argc, char ** argv) {
    std::vector<std::string> args {argv + 1, argv + argc};
    try {
        sdattool::Options options(args);
        return options.main();
    } catch (sdattool::ArgumentError const &e) {
        sdattool::Options::usage(std::cerr);
        std::cerr << e.what() << std::endl;
        return 1;
    } catch (std::exception const &e) {
        std::cerr << "Unhandled exception: " << e.what() << std::endl;
        return 1;
    }
}
