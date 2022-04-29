#ifndef SDATCOMP_SDATBUFFER_H
#define SDATCOMP_SDATBUFFER_H

#include <fstream>
#include <sstream>
#include <string>
#include <array>
#include <cstring>

namespace sdattool {

    class SDATBuffer {
        std::basic_string<unsigned char> data;
        std::fstream handle;
        ssize_t cursor = 0;
        std::ios_base::openmode openmode;

        ssize_t &get_pos_r(ssize_t &_pos) {
            return (_pos < 0 ? cursor : _pos);
        }

    public:
        SDATBuffer() = default;
        SDATBuffer(std::string const &filename, std::ios_base::openmode const &_openmode = std::ios_base::in) {
            open(filename, _openmode);
        }

        void open(std::string const &filename, std::ios_base::openmode const &_openmode = std::ios_base::in) {
            openmode = _openmode | std::ios_base::binary;
            handle.open(filename, openmode);
            if (openmode & std::ios_base::in) {
                handle.seekg(0, std::ios_base::end);
                auto fsize = handle.tellg();
                data.resize(fsize);
                handle.seekg(0);
                handle.read((char *)data.data(), fsize);
                handle.seekg(0);
            }
        }

        ~SDATBuffer() {
            if (openmode & std::ios_base::out) {
                handle.seekp(0);
                handle.write((const char *)data.data(), data.size());
                handle.flush();
                handle.seekp(0);
            }
        }

        template <typename T>
        void puti(T const val, ssize_t _pos = -1) {
            ssize_t &pos = get_pos_r(_pos);
            if (pos + sizeof(val) > data.size()) {
                data.resize(pos + sizeof(val));
            }
            for (int i = 0; i < sizeof(val); i++) {
                data[pos + i] = (val >> (8 * i)) & 0xFF;
            }
            pos += sizeof(val);
        }

        template <typename T>
        T geti(ssize_t _pos = -1) {
            ssize_t &pos = get_pos_r(_pos);
            T val {0};
            if (pos + sizeof(val) <= data.size()) {
                for (int i = 0; i < sizeof(val); i++) {
                    val |= data[pos + i] << (8 * i);
                }
                pos += sizeof(val);
            }
            return val;
        }

        template <class T>
        T putd(T const &sdata, ssize_t _pos = -1) {
            ssize_t &pos = get_pos_r(_pos);
            if (pos + sizeof(sdata) > data.size()) {
                data.resize(pos + sizeof(sdata));
            }
            memcpy(&data[pos], &sdata, sizeof(sdata));
            pos += sizeof(sdata);
        }

        template <class T>
        void getd(T &sdata, ssize_t _pos = -1) {
            ssize_t &pos = get_pos_r(_pos);
            if (pos + sizeof(sdata) <= data.size()) {
                memcpy(&sdata, &data[pos], sizeof(sdata));
                pos += sizeof(sdata);
            }
        }

        template <class T>
        void getd(T *const pdata, ssize_t _pos = -1) {
            ssize_t &pos = get_pos_r(_pos);
            if (pos + sizeof(*pdata) <= data.size()) {
                memcpy(pdata, &data[pos], sizeof(*pdata));
                pos += sizeof(*pdata);
            }
        }

        void puts(const void *const ptr, const size_t size, ssize_t _pos = -1) {
            ssize_t &pos = get_pos_r(_pos);
            if (pos + size <= data.size()) {
                memcpy(&data[pos], ptr, size);
                pos += size;
            }
        }

        void gets(void *const ptr, const size_t size, ssize_t _pos = -1) {
            ssize_t &pos = get_pos_r(_pos);
            if (pos + size <= data.size()) {
                memcpy(ptr, &data[pos], size);
                pos += size;
            }
        }

        void *getsa(const size_t size, ssize_t _pos = -1) {
            void *ret = nullptr;
            ssize_t &pos = get_pos_r(_pos);
            if (pos + size <= data.size()) {
                ret = new unsigned long[(size + 3) / sizeof(unsigned long)];
                memcpy(ret, &data[pos], size);
                pos += size;
            }
            return ret;
        }

        std::string getstr(ssize_t _pos = -1) {
            ssize_t &pos = get_pos_r(_pos);
            return std::string((char *)&data[pos]);
        }

        std::size_t tell() const {
            return cursor;
        }

        std::size_t get_size() const {
            return data.size();
        }

        bool seek(ssize_t const pos, std::ios_base::seekdir const dir = std::ios_base::beg) {
            ssize_t new_cursor;
            switch (dir) {
            case std::ios_base::beg:
                new_cursor = pos;
                break;
            case std::ios_base::end:
                new_cursor = get_size() - pos;
                break;
            case std::ios_base::cur:
                new_cursor = cursor + pos;
                break;
            }
            if (new_cursor < 0 || new_cursor >= get_size()) {
                return false;
            }
            cursor = new_cursor;
            return true;
        }

        bool is_open() const {
            return handle.is_open();
        }
    };

} // sdattool

#endif //SDATCOMP_SDATBUFFER_H
