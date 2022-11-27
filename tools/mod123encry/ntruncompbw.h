#ifndef GUARD_NTRUNCOMPBW_H
#define GUARD_NTRUNCOMPBW_H

#ifdef __cplusplus
extern "C" {
#endif

#include <stdint.h>
#include <stddef.h>

uint32_t MIi_UncompressBackwards(unsigned char ** out_p, size_t compsize);

#ifdef __cplusplus
}
#endif

#endif //GUARD_NTRUNCOMPBW_H
