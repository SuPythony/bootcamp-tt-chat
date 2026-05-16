# Exercise 2

**Update this README with your answers to the questions below.**

## Sources of Information for Questions from Before

### Socket

- https://man7.org/linux/man-pages/man2/socket.2.html - System call reference
  for creating communication endpoints
- Or type `man socket` in terminal
- https://man7.org/linux/man-pages/man7/socket.7.html - Socket interface
  overview and protocol families
- Or type `man 7 socket` in terminal
- When would you want to use a `SOCK_RAW` stream?
  <br> Use it when I want to create my own packets. It prevents the OS from automatically wrapping the packet in the TCP/UDP headers and allows us to do that on our own. It is used to implement our own network protocols and bypass the OS's default protocols such as TCP or UDP.

### TCP and IP Protocols

- [IPv4](https://www.rfc-editor.org/info/rfc791) - Internet Protocol
  specification defining packet structure and routing
- [IPv6](https://www.rfc-editor.org/info/rfc8200) - Next-generation Internet
  Protocol with expanded address space
- [TCP](https://datatracker.ietf.org/doc/html/rfc9293) - Transmission Control
  Protocol providing reliable, ordered data delivery

### C++

- [C++23 ISO standard draft](https://www.open-std.org/jtc1/sc22/wg21/docs/papers/2023/n4950.pdf) -
  Working draft of the C++ language specification
- Is the above the official C++23 spec?
  <br> No, this is final working draft, but not the official ISO document.
- Where is the official C++23 spec?
  <br> The official standard is ISO International Standard ISO/IEC 14882:2024(E) – Programming Language C++. It is not available freely and can be purchased from the ISO store.
- Why was this link chosen instead?
  <br> Because the working draft is free and publicly available.
- Is this a helpful reference for learning C++?
  <br> No it can't really work as a reference for learning and developing using C++. It is not written with developers but instead it acts as an official source for any ambiguities in the language. The standard easy-to-use reference is cppreference.com.
- Can the various implementations of C++ compilers be different from the
  C++ standard?
  <br> Yes, because it's upto the compiler vendors to implement the standard. They might unintentionally introduce bugs that deviate from the standard or add certain features of their own on top of it.
- What are the most widely used and most significant C++ compilers?
  <br> GCC (g++), CLang, MSVC
- Where is the equivalent spec for C++26?
  <br> https://eel.is/c++draft/. The working draft is officialy final and complete.

- Where do you find the spec for the HTTP protocol?
  <br> IETF RFCs 9110-9114. IETF releases free RFCs which act as the standard specs for network protocols.
- What about HTTPS? Is there a spec for that protocol?
  <br> It does not have a spec as it is not a separate protocol from HTTP but just HTTP layered over another protocol (TLS, Transport Layer Security).

## Introduction to C++ and Sockets Programming

- Read the code in `src/`
- Are there any bugs in this code?
- What can you do to identify if there are bugs in the code?

## Refactoring: Extract Function

- What is different in this code compared to exercise-1?
- Is this code better or worse than exercise-1?
- What are the tradeoffs compared to exercise-1?
- Are you able to spot any mistakes or inconsistencies in the changes?

## Thinking About Performance

- Does writing code this way have any impact on performance?
- What do we mean when we say performance?
- How do we measure performance in a program?

## Play with Git

- There isn't necessarily a single correct answer for how to abstract the
  code from exercise-1 into functions
- Try different ways to refactor the code from exercise-1 to make it more
  readable.
- Make sure to commit each change as small and self-contained commit
- This will make it easier to revert your code if you need to
- What is `git tag`? How is `git tag` different from `git branch`?
- How can you use `git tag` and `git branch` to make programming easier and
  more fun?

## Learn Basics of Debugging in Your IDE

- How do you enable debug mode in your IDE?
- In debug mode, how do you add a watch?
- In debug mode, how do you add a breakpoint?
- In debug mode, how do you step through code?

### Memory Management and Debug Mode in Your IDE

- How do you see the memory layout of a `std::string` from your IDE debug mode?
- How do you see the memory layout of a struct from your IDE debug mode?
