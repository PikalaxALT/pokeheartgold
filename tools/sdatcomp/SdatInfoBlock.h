#ifndef SDATCOMP_SDATINFOBLOCK_H
#define SDATCOMP_SDATINFOBLOCK_H

#include <map>
#include "SdatBuffer.h"

namespace sdattool {

    class SDATInfoBlock {
    public:
        SDATInfoBlock();
        SDATInfoBlock(SDATBuffer &buffer);
        virtual void write(SDATBuffer &buffer) = 0;
    };

    class SEQInfo : public SDATInfoBlock {
        std::uint16_t bankNo;
        std::uint8_t volume;
        std::uint8_t channelPrio;
        std::uint8_t playerPrio;
        std::uint8_t playerNo;
        std::uint16_t reserved;
    public:
        SEQInfo(SDATBuffer &buffer) {}
        void write(SDATBuffer &buffer) {

        }
    };

} // sdattool

#endif //SDATCOMP_SDATINFOBLOCK_H
