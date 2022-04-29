#ifndef SDATCOMP_OPTIONS_H
#define SDATCOMP_OPTIONS_H

#include <string>
#include <vector>
#include <iostream>
#include "NitroSdatTypes.h"

#if (__cplusplus < 201703L)
#include <experimental/filesystem>
namespace fs = std::experimental::filesystem;
#else
#include <filesystem>
namespace fs = std::filesystem;
#endif

namespace sdattool {

    static const char version[] {"v0.1.0a0"};

    class Options {
        std::string filename {""};
        std::string folder {""};
        bool mode {false};
        bool optimize {false};
        bool optimizeSize {false};
        bool optimizeRAM {false};
        bool noSymbBlock {false};

        // Data buffers
        NNSSndArcHeader header {0};
        NNSSndArcInfo *info {nullptr};
        NNSSndArcFat *fat {nullptr};
        NNSSndArcSymbol *symbol {nullptr};

        // Unpack
        int main_unpack();
        int main_build();
    public:
        static std::ostream &usage(std::ostream &os) {
            os << "SDAT-Tool-CPP " << version << ": Unpack/Pack NDS SDAT Files\n\n" \
              "Usage: sdatcomp [OPTIONS] SDATfile [folder]\n\n" \
              "Options:\n" \
              "  -u, --unpack\n" \
              "  -b, --build\n" \
              "  -o, --optimize: Remove unused and duplicate files\n" \
              "  -os, --optimize_size: Build Optimized for filesize\n" \
              "  -or, --optimize_ram: Build Optimized for RAM\n" \
              "  -ns, --noSymbBlock: Build without a SymbBlock" << std::endl;
            return os;
        }
        Options(std::vector<std::string> &argv);
        int main();
    };

}

#endif //SDATCOMP_OPTIONS_H
