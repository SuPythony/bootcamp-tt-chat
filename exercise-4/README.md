# Exercise 4

**Update this README with your answers to the questions below.**

## Learning Multi-File C++ Projects

- Move code that can be shared between `tcp_echo_server.cc` and 
  `tcp_echo_client.cc` to separate `.h` and `.cc` files
- How would you compile from the command line?
<br> A: `g++ -std=c++20 tcp_echo_client.cc utils.cc utils.h -o client` and `g++ -std=c++20 tcp_echo_server.cc utils.cc utils.h -o server`
- How would you compile using make?
<br> A: Updated the Makefile.
- How would you compile using VS Code?
<br> A: Setup a build task.

### Compiling vs Linking

- What is the difference between compiling and linking in C++?
<br> A: Compiling takes your soruce code files (.cpp/.cc/.hpp/.h) and generates binary object files (.o). Linking takes those object files along with external libraries and combines them into a single executable.
- What is the difference between creating an executable and creating a 
  library?
<br> A: An executable is not meant to be shared and always re-compiled from the source code. On the other hand a library is meant to be shareable and reusable, and is created by compiling into object files and then building it into a static/dynamic library (.a/.so).
- How do you compile a library, and then use that library to compile an
  executable?
<br> A: First create the object files (.o) from the library source code. Then using the `ar rcs` command combine those object files into a static library (.a). To use that library in another program, put the library in the root diretory of the project, include the necessary headers, and then compile with flags `-L. -l<library_name>`.

### Reminder 
[Quickstart tutorial to make](https://makefiletutorial.com/) - Learn make 
fundamentals with practical examples and common patterns.

## Experiments in Performance

- Is it better to have many small files spread across many directories, or
  a few large files across fewer directories?
<br> A: Depends on the project structure and the team building it. I think it's better to segregate the codebase into several smaller files and directories so that it's easily navigatable and we can easily find particular entities. But we should not overdo it by trying to separate everything into different files.
- Is there a difference in compilation time between the two?
<br> A: Yes. Many small files and directories lead to a slower initial build time, but later builds are faster as a change in a file will only require a small file to be recompiled. Few large files and directories will have a faster initial build time but (relatively to small files) slower subsequent builds as even a small change will require a large file to be recompiled.
- How can you assess performance other than compilation speed?
<br> A: Using profiler tools. (I interpret the question as asking how to assess runtime performance.)