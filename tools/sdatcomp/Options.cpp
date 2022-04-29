#include "Options.h"
#include "Exception.h"
#include "SdatBuffer.h"

namespace sdattool {

    Options::Options(std::vector<std::string> &argv) {
        bool sawModeArg = false;
        for (auto const &arg : argv) {
            if (arg == "-u" || arg == "--unpack") {
                if (sawModeArg) {
                    throw ArgumentError("Can only take one of -u/--unpack or -b/--build");
                }
                mode = false;
                sawModeArg = true;
            } else if (arg == "-b" || arg == "--build") {
                if (sawModeArg) {
                    throw ArgumentError("Can only take one of -u/--unpack or -b/--build");
                }
                mode = true;
                sawModeArg = true;
            } else if (arg == "-o" || arg == "--optimize") {
                optimize = true;
            } else if (arg == "-os" || arg == "--optimize_size") {
                if (optimizeRAM) {
                    throw ArgumentError("Cannot optimize for both size and RAM");
                }
                optimizeSize = true;
                optimize = true;
            } else if (arg == "-or" || arg == "--optimize_ram") {
                if (optimizeSize) {
                    throw ArgumentError("Cannot optimize for both size and RAM");
                }
                optimizeRAM = true;
                optimize = true;
            } else if (arg == "-ns" || arg == "noSymbBlock") {
                noSymbBlock = true;
            } else if (arg[0] == '-') {
                throw ArgumentError("Unrecognized option flag " + arg);
            } else if (filename.empty()) {
                filename = arg;
            } else if (folder.empty()) {
                folder = arg;
            } else {
                throw ArgumentError("Unrecognized extra arg(s) (first one: " + arg + ")");
            }
        }
        if (!sawModeArg) {
            throw ArgumentError("Missing mode switch (-u/--unpack or -b/--build)");
        }
        if (filename.empty()) {
            throw ArgumentError("Missing required argument: " + filename);
        } else if (filename.rfind(".sdat") == std::string::npos) {
            throw ArgumentError("File is not an SDAT file");
        }
        if (folder.empty()) {
            folder = filename.substr(0, filename.rfind(".sdat"));
        }
        std::string folder_l = folder, filename_l = filename;
        std::for_each(folder_l.begin(), folder_l.end(), [](char &c) {c = tolower(c);});
        std::for_each(filename_l.begin(), filename_l.end(), [](char &c) {c = tolower(c);});
        if (folder_l == filename_l) {
            throw ArgumentError("Input and output cannot match");
        }
    }

    int Options::main() {
        return mode ? main_build() : main_unpack();
    }

    int Options::main_unpack() {
        fs::create_directories(folder);
        sdattool::SDATBuffer buffer {filename};
        size_t fileSize = buffer.get_size();
        // Read the SDAT header
        buffer.seek(0);
        buffer.getd(header);
        // Read the binary blocks
        info = (NNSSndArcInfo *)buffer.getsa(header.infoSize, header.infoOffset);
        fat = (NNSSndArcFat *)buffer.getsa(header.fatSize, header.infoOffset);
        if (header.symbolDataSize > 0) {
            symbol = (NNSSndArcSymbol *)buffer.getsa(header.symbolDataSize, header.symbolDataOffset);
        }

        buffer.seek(header.fileImageOffset);
        // todo
        return 0;
    }

    int Options::main_build() {
        // todo
        return 0;
    }

}
