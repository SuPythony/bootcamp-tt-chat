.LC0:
        .string "\n"
check_error(bool, std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char>>):
        push    rbp
        mov     rbp, rsp
        sub     rsp, 16
        mov     eax, edi
        mov     QWORD PTR [rbp-16], rsi
        mov     BYTE PTR [rbp-4], al
        cmp     BYTE PTR [rbp-4], 0
        je      .L20
        mov     rax, QWORD PTR [rbp-16]
        mov     rsi, rax
        mov     edi, OFFSET FLAT:std::cerr
        call    std::basic_ostream<char, std::char_traits<char>>& std::operator<<<char, std::char_traits<char>, std::allocator<char>>(std::basic_ostream<char, std::char_traits<char>>&, std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char>> const&)
        mov     esi, OFFSET FLAT:.LC0
        mov     rdi, rax
        call    std::basic_ostream<char, std::char_traits<char>>& std::operator<<<std::char_traits<char>>(std::basic_ostream<char, std::char_traits<char>>&, char const*)
        mov     edi, 1
        call    exit
.L20:
        nop
        leave
        ret
.LC1:
        .string "Socket creation error\n"
create_socket():
        push    rbp
        mov     rbp, rsp
        push    rbx
        sub     rsp, 56
        mov     edx, 0
        mov     esi, 1
        mov     edi, 2
        call    socket
        mov     DWORD PTR [rbp-20], eax
        lea     rax, [rbp-21]
        mov     rdi, rax
        call    std::allocator<char>::allocator() [complete object constructor]
        lea     rdx, [rbp-21]
        lea     rax, [rbp-64]
        mov     esi, OFFSET FLAT:.LC1
        mov     rdi, rax
        call    std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char>>::basic_string<std::allocator<char>>(char const*, std::allocator<char> const&)
        mov     eax, DWORD PTR [rbp-20]
        shr     eax, 31
        movzx   eax, al
        lea     rdx, [rbp-64]
        mov     rsi, rdx
        mov     edi, eax
        call    check_error(bool, std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char>>)
        lea     rax, [rbp-64]
        mov     rdi, rax
        call    std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char>>::~basic_string() [complete object destructor]
        lea     rax, [rbp-21]
        mov     rdi, rax
        call    std::allocator<char>::~allocator() [complete object destructor]
        mov     eax, DWORD PTR [rbp-20]
        jmp     .L27
        mov     rbx, rax
        lea     rax, [rbp-64]
        mov     rdi, rax
        call    std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char>>::~basic_string() [complete object destructor]
        jmp     .L24
        mov     rbx, rax
.L24:
        lea     rax, [rbp-21]
        mov     rdi, rax
        call    std::allocator<char>::~allocator() [complete object destructor]
        mov     rax, rbx
        mov     rdi, rax
        call    _Unwind_Resume
.L27:
        mov     rbx, QWORD PTR [rbp-8]
        leave
        ret
        .set    std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char>>::_Alloc_hider::~_Alloc_hider() [complete object destructor],_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_Alloc_hiderD2Ev
        .set    std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char>>::~basic_string() [complete object destructor],_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev
.LC2:
        .string "basic_string: construction from null is not valid"
        .set    std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char>>::basic_string<std::allocator<char>>(char const*, std::allocator<char> const&),_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC2IS3_EEPKcRKS3_
        .set    std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char>>::_Alloc_hider::_Alloc_hider(char*, std::allocator<char> const&) [complete object constructor],_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_Alloc_hiderC2EPcRKS3_
        .set    void std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char>>::_M_construct<char const*>(char const*, char const*, std::forward_iterator_tag)::_Guard::_Guard(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char>>*) [complete object constructor],_ZZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIPKcEEvT_S8_St20forward_iterator_tagEN6_GuardC2EPS4_
        .set    void std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char>>::_M_construct<char const*>(char const*, char const*, std::forward_iterator_tag)::_Guard::~_Guard() [complete object destructor],_ZZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIPKcEEvT_S8_St20forward_iterator_tagEN6_GuardD2Ev
.LC3:
        .string "basic_string::_M_create"
__static_initialization_and_destruction_0(int, int):
        push    rbp
        mov     rbp, rsp
        sub     rsp, 16
        mov     DWORD PTR [rbp-4], edi
        mov     DWORD PTR [rbp-8], esi
        cmp     DWORD PTR [rbp-4], 1
        jne     .L130
        cmp     DWORD PTR [rbp-8], 65535
        jne     .L130
        mov     edi, OFFSET FLAT:std::__ioinit
        call    std::ios_base::Init::Init() [complete object constructor]
        mov     edx, OFFSET FLAT:__dso_handle
        mov     esi, OFFSET FLAT:std::__ioinit
        mov     edi, OFFSET FLAT:std::ios_base::Init::~Init() [complete object destructor]
        call    __cxa_atexit
.L130:
        nop
        leave
        ret
_GLOBAL__sub_I_check_error(bool, std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char>>):
        push    rbp
        mov     rbp, rsp
        mov     esi, 65535
        mov     edi, 1
        call    __static_initialization_and_destruction_0(int, int)
        pop     rbp
        ret