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
  <br> Yes
  <br> In client:
  <br> 1. In read_args, the default message if no argument is passed is never used, as it exits if no argument is there.
  <br> 2. In send_and_receive_message, after read, the buffer is not null-terminated which will lead to undefined behaviour.
  <br> In server:
  <br> 1. set_socket_options returns an unused bool
  <br> 2. In handle_accept, after read, the buffer is not null-terminated which will lead to undefined behaviour.
  <br> General:
  <br> In both client and server we read only once and hope that the message is fully received. As we are using TCP, this is not guaranteed and we might need re-reading to get the intended data.
- What can you do to identify if there are bugs in the code?
  <br> Use compiler warnings by using flags like -Wextra -Wall. Use the address sanitizer using -fsanitize. Use valgrind for catching memory bugs/leaks. Come up with and test using several edge cases.

## Refactoring: Extract Function

- What is different in this code compared to exercise-1?
  <br> All the important steps in setting up the client and server are extracted into self-contained functions.
- Is this code better or worse than exercise-1?
  <br> This is better as improves the code readability. It also makes it easy for someone new to the codebase to understand the code, maked the code more approachable.
- What are the tradeoffs compared to exercise-1?
  <br> We give away the simplicity and speed of writing the program while improving the readability and maintainability.
- Are you able to spot any mistakes or inconsistencies in the changes?
  <br> Just the bugs mentioned above.

## Thinking About Performance

- Does writing code this way have any impact on performance?
  <br> Without compiler optimizations, yes, calling and returning from functions in assembly requires extra instructions for managing the stack and register states and might impact performance a bit. But when using compiler optimizations (-O2 and above) the compiler tries to make the functions inline, essentially generating the same assembly as one before refactoring, and thus not impacting performance in any meaningful way.
- What do we mean when we say performance?
  <br> It generally means how fast a program performs, but can broadly refers to one of these depending on context: Latency, Throughput, CPU processing time.
- How do we measure performance in a program?
  <br> Use profiling, perf command.

## Play with Git

- There isn't necessarily a single correct answer for how to abstract the
  code from exercise-1 into functions
- Try different ways to refactor the code from exercise-1 to make it more
  readable.
- Make sure to commit each change as small and self-contained commit
- This will make it easier to revert your code if you need to
- What is `git tag`? How is `git tag` different from `git branch`?
  <br> `git tag` is used to create a permanent pointer (a 'tag') to a particular commit used mainly to represent release versions. Unlike tags, a branch is a movable pointer to the latest commit. It departs at a particular commitfrom another branch and can be updated with new commits, completely separate from the main and other branches. It is used for easily maintaing separate feature branches and pull-requests.
- How can you use `git tag` and `git branch` to make programming easier and
  more fun?
  <br> I generally use branches when I am adding a major new feature to a project. This way I can safely have a restore point to start over (just delete the branch and restart from main) in case the feature development goes wrong. Branches can also be used to creat pull requests (PRs) which are useful when working in a team. A PR can be created by someone and then reviewed by other team members to ensure correctness. Afterwards it can be merged.
  <br> Tags are used for keeping track of the release versions of a project. We can track which commit represented a version release, and rebuild specific versions. Tags can also be used to maintain other info using annotations like added features, state etc.
  <br> Thus by using branches and tags it's very easy and tension-free to maintain a project.

## Learn Basics of Debugging in Your IDE

- How do you enable debug mode in your IDE?
  <br> VSCode: Create a launch.json, open Run and Debug. Compile the program with -g. Use F5 to start debugging.
- In debug mode, how do you add a watch?
  <br> When paused at a breakpoint, click the + in the watch section in the Run and Debug panel and enter the expression to watch.
- In debug mode, how do you add a breakpoint?
  <br> Click on the red dot in the space left to the line number to add a breakpoint to a particular point.
- In debug mode, how do you step through code?
  <br> Use continue (F5) to run till next breakpoint.
  <br> Use step (F10) over to go to next function call.
  <br> Use step into (F11) to go into functions (debug the function execution as well).
  <br> Use step out (Shift+F11) to go out of functions.

### Memory Management and Debug Mode in Your IDE

- How do you see the memory layout of a `std::string` from your IDE debug mode?
- How do you see the memory layout of a struct from your IDE debug mode?
