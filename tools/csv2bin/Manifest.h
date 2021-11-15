#ifndef GUARD_MANIFEST_H
#define GUARD_MANIFEST_H

#include "global.h"

template <typename T = unsigned, typename C = char>
C* to_array(C* buf, const T val, off_t offset = 0) {
    for (int i = 0; i < sizeof(T); i++) {
        buf[offset + i] = (val >> (8 * i * sizeof(C)));
    }
    return buf;
}

template <typename T = unsigned, typename C = char>
T from_array(const C* buf, off_t offset = 0) {
    T ret = 0;
    for (int i = 0; i < sizeof(T); i++) {
        ret |= buf[offset + i] << (8 * i * sizeof(C));
    }
    return ret;
}

class padding_warning : public std::exception {
    std::string _what;
public:
    padding_warning(const char *c) : _what(c) {}
    padding_warning(const std::string &s) : _what(s) {}
    const char * what() const noexcept { return _what.c_str(); }
};

class ColumnSpec {
    typedef int width_t;
    static const width_t u8   =   1;
    static const width_t u16  =   2;
    static const width_t u32  =   4;
    static const width_t u64  =   8;
    static const width_t s8   =  -1;
    static const width_t s16  =  -2;
    static const width_t s32  =  -4;
    static const width_t s64  =  -8;
    static const width_t skip = 256;
    static const width_t pad  = 512;

    width_t width = 0;                              // number of bytes. positive = unsigned, negative = signed
    std::unordered_map<std::string, int> constants; // from a C header, specified in the manifest

    void align(std::ofstream &strm) const;
    void align(std::ifstream &strm) const;
    void _init(int _width, const fs::path &headerfile = "", const std::string &prefix = "");
public:
    ColumnSpec() = default;
    explicit ColumnSpec(int _width, const fs::path& headerfile = "", const std::string &prefix = "");
    explicit ColumnSpec(std::string &_width, const fs::path& headerfile = "", const std::string &prefix = "");
    std::string read(std::ifstream &strm, int row_i = -1) const;
    void write(std::ofstream &strm, const std::string& data) const;
    size_t size() const {
        if (width == skip) {
            return 0;
        }
        if ((width & ~0xFF) == pad) {
            return width & 0xFF;
        }
        return abs(width);
    }
    bool is_signed() const { return width < 0; }
    bool is_init() const { return width != 0; }
    bool is_padding() const { return (width & ~0xFF) == pad; }
    bool is_skipped() const { return width == skip; }
};

// File format: newline separated
class Manifest {
    std::map<std::string, ColumnSpec> mapping; // maps column name to column specification
public:
    std::vector<std::string> colnames;         // column ordering
    using manifest_iter = std::map<std::string, ColumnSpec>::iterator;
    using manifest_const_iter = std::map<std::string, ColumnSpec>::const_iterator;
    using manifest_reverse_iter = std::map<std::string, ColumnSpec>::reverse_iterator;
    using manifest_const_reverse_iter = std::map<std::string, ColumnSpec>::const_reverse_iterator;
    Manifest() = default;
    explicit Manifest(fs::path const &filename, std::vector<fs::path> &header_dirs);
    void read(fs::path const &filename, std::vector<fs::path> &header_dirs);
    ColumnSpec &operator[](const std::string &name);
    manifest_iter begin() { return mapping.begin(); }
    manifest_iter end() { return mapping.end(); }
    manifest_const_iter cbegin() { return mapping.cbegin(); }
    manifest_const_iter cend() { return mapping.cend(); }
    manifest_reverse_iter rbegin() { return mapping.rbegin(); }
    manifest_reverse_iter rend() { return mapping.rend(); }
    manifest_const_reverse_iter crbegin() { return mapping.crbegin(); }
    manifest_const_reverse_iter crend() { return mapping.crend(); }
    [[nodiscard]] size_t size(const int alignment = 4) const;
    template <typename Iter>
    void assign(Iter first, Iter last) {
        mapping.clear();
        for (auto pair = first; pair != last; pair ++) {
            mapping[pair->first] = pair->second;
        }
    }
};


#endif //GUARD_MANIFEST_H
