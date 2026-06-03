.LC0:
        .string "Socket creation error\n"
create_socket():
        push    rbp
        mov     rbp, rsp
        sub     rsp, 16
        mov     edx, 0
        mov     esi, 1
        mov     edi, 2
        call    socket
        mov     DWORD PTR [rbp-4], eax
        cmp     DWORD PTR [rbp-4], 0
        jns     .L2
        mov     esi, OFFSET FLAT:.LC0
        mov     edi, OFFSET FLAT:std::cerr
        call    std::basic_ostream<char, std::char_traits<char>>& std::operator<<<std::char_traits<char>>(std::basic_ostream<char, std::char_traits<char>>&, char const*)
        mov     edi, 1
        call    exit
.L2:
        mov     eax, DWORD PTR [rbp-4]
        leave
        ret
__static_initialization_and_destruction_0(int, int):
        push    rbp
        mov     rbp, rsp
        sub     rsp, 16
        mov     DWORD PTR [rbp-4], edi
        mov     DWORD PTR [rbp-8], esi
        cmp     DWORD PTR [rbp-4], 1
        jne     .L6
        cmp     DWORD PTR [rbp-8], 65535
        jne     .L6
        mov     edi, OFFSET FLAT:std::__ioinit
        call    std::ios_base::Init::Init() [complete object constructor]
        mov     edx, OFFSET FLAT:__dso_handle
        mov     esi, OFFSET FLAT:std::__ioinit
        mov     edi, OFFSET FLAT:std::ios_base::Init::~Init() [complete object destructor]
        call    __cxa_atexit
.L6:
        nop
        leave
        ret
_GLOBAL__sub_I_create_socket():
        push    rbp
        mov     rbp, rsp
        mov     esi, 65535
        mov     edi, 1
        call    __static_initialization_and_destruction_0(int, int)
        pop     rbp
        ret