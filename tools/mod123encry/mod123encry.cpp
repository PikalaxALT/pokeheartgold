#include <iostream>
#include <string>
#include "Decrypt.h"
#include "Encrypt.h"

std::string usage_message(std::string const& progname) {
    return "Usage: " + progname + " (encry|decry) OPTIONS\n\n"
           "Global options:\n"
           "-h            Show this message and exit\n\n"
           "encry usage:\n"
           "\t" + progname + " encry buildname outfile ovy_id\n"
           "buildname     NEF prefix, typically 'main'\n"
           "outfile       Path to save the encrypted output\n"
           "ovy_id        Index of the overlay to encrypt, typically 123\n\n"
           "decry usage:\n"
           "\t" + progname + " decry baserom outfile ovy_id\n"
           "baserom       Path to NDS ROM file, typically 'baserom.nds'\n"
           "outfile       Path to save the encrypted output\n"
           "ovy_id        Index of the overlay to encrypt, typically 123";
}

int main(int argc, char ** argv) {
    // Usage:
    // mod123encry decry BASEROM OUTFILE OVY_ID
    // mod123encry encry BUILDNAME OUTFILE OVY_ID
    try {
        if (argc < 2) {
            throw std::invalid_argument("missing required argument: mode");
        }
        Options *options;
        switch (Options::TranslateExecMode(argv[1])) {
        case EXEC_DECRY:
            options = new DecryptOptions(argc, argv);
            break;
        case EXEC_ENCRY:
            options = new EncryptOptions(argc, argv);
            break;
        case EXEC_HELP:
            std::cout << usage_message(argv[0]) << "\n";
            return 0;
        }

        int ret = options->main();
        delete options;
        return ret;
    } catch (std::exception &e) {
        std::cerr << "An exception has occurred: " << e.what() << std::endl
                  << "For usage, run \"" << argv[0] << " -h\"" << std::endl;
        return 1;
    }
}
