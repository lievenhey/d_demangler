import std.demangle : demangle;
import std.conv : to;
import std.string : toStringz;
import core.stdc.string : strncpy;

extern (C) int demangle_symbol(const(char)* c_name, char* buffer, size_t size)
{
        const auto name = to!string(c_name);
        auto demangled = demangle(name);

        if (name == demangled) {
                return 0;
        }

        const auto c_demangled = toStringz(demangled);
        strncpy(buffer, c_demangled, size - 1);

        return 1;
}
