# Exercise 3

**Update this README with your answers to the questions below.**

## Re-using Code

- Read the code in `src/tcp_echo_client.cc`
- A new function `check_error()` has been created and `create_socket()` from
  exercise-2 has been refactored to make use of it
- What are the benefits of writing code in this way?
  <br> A: It follows the DRY (Don't Repeat Yourself) principle. We don't have to repeatedly write the if condition, and as the action on error is same, we prevent rewriting that.
- Are there any costs to writing code like this?
  <br> A: Function call overhead (but the compiler might choose to inline it). Also we can't take specific action based on what the error is or where it occurred. For example in connect_to_server, we are not able to close the socket as the error handling is not specialised.
- Apply `check_error` to all the code in `src/`
  <br> Refactored `check_error` to accept a socket. If it's valid, close it.

## Introduction to Compiler Explorer

- Try out the old `create_socket()` and the new `check_error()` and
  `create_socket()` in [Compiler Explorer](https://godbolt.org) - Interactive
  tool for exploring how C++ code compiles to assembly
- What is happening here?
  <br> A: The refactord version has a higher number of instuctions. This is due to function call overhead (adhering to the calling convention), the string contructor (in the old version, the message is a constant in .rodata).
- Can you think of any different approaches to this problem?
  <br> A: We can make `check_error` inline. We can use `std::string_view`. These will reduce the no of instructions only when using optimization flags.
- How can you modify your Makefile to generate assembly code instead of
  compiled code?
  <br> A: Make .s targets and compile with -S flag to generate assembly.
- **Note**: You can save the generated assembly from Compiler Explorer
- **Bonus**: Can you view assembly code using your IDE?
  <br> A: Compile to assembly and open it in the IDE.
- **Bonus**: How do you see the assembly when you step through each line in
  debugging mode from your IDE?
  <br> A: Open the disassembly view in the run and debug tab.
- [x86 assembly reference](http://ref.x86asm.net/) - Comprehensive reference
  for x86 assembly language instructions and syntax

## More About Memory Management

- Make sure you have `-fsanitize=address` in both your `CXX_FLAGS` and
  `LD_FLAGS` in your Makefile
- What do `-fsanitize=address`, `CXX_FLAGS` and `LD_FLAGS` mean?
  <br> A: `-fsanitize=address` enables the address sanitizer. `CXXFLAGS` and `LDFLAGS` are convention in Makefile for the flags passed to the compiler (building object files) and the linker (linking object files) repsectively.
- With the new tool of the Compiler Explorer, and keeping in mind what you
  have learned about how to use debug mode
- What happens when you look at a `std::string` using the above methods?
  <br> A: Through Compiler Explorer, without any optimization flags, it stores the raw string in a `.string` directive and calls `basic_string`'s constructor along with an allocator to create the string object.
  <br> With optimization flags, instead of having a directive, it uses the `movabs` instruction (on x86-64) to construct the string directly in binary (ascii) through several 64-bit integral constants. When string are short, it uses Small String Optimization (SSO) to store the string directly on the stack. If the string is longer, it calls `new` to allocate memory on the heap for the string object and then constructs the string using the above mentioned process.
- Where is the text in your `std::string`?
  <br> A: With SSO it's in the stack, without it it's allocated on the heap.
- What is `std::optional`?
  <br> A: It is a container for a value of a particular type that may or may not be present. It can either have a valid value or no value (in which case, it is said to have `std::nullopt`).
- How do you find out the memory layout of a `std::optional`?
  <br> A: By reading cppreference and experimenting on compiler explorer. It stores the value within itself, directly on the stack without allocating on the heap.
- Read https://en.cppreference.com/w/cpp/memory#Smart_pointers - Guide to
  modern C++ memory management using smart pointers
- Which pointer types are the most important to know about?
  <br> A: `unique_ptr`, `shared_ptr`, `weak_ptr`
- Which smart pointer should you use by default if you can?
  <br> A: `unique_ptr`
- Does changing your optimization level in `CXXFLAGS` from `-O0` to `-O3` have
  any impact on the answers to any of the above questions?
  <br> A: As already mentioned, using `-O3` there's aggressive compiler optimization and short strings are SSO'd and `movabs` is used.

## More Thinking About Performance

- After your experiments with Compiler Explorer, do you have any updates for
  your answers in exercise-2?
  <br> A: Not really. But now I'll use Compiler Explorer as a debugging and performance analysis tool, to see what exactly is happening with my code and how are different compiler flags really affecting it.

### Bonus: Do Not Watch Now

- [More about Compiler Explorer](https://www.youtube.com/watch?v=bSkpMdDe4g4) -
  Deep dive into compiler optimization and assembly analysis
    - Create a struct which contain many different data types
    - Look at the memory layout in the debugger
    - Create a `char` or `uint8_t` pointer to the beginning of the struct,
      iterate to the end of the struct, printing out the value of each byte in
      hexadecimal
    - Try accessing different parts of the struct and see in compiler explorer
      what the assembly looks like
    - What happens if you iterate the pointer to outside the bounds of your
      array?
    - Let's say your struct is called `Foo`
    - What is the difference between `std::vector<Foo>` and `std::vector<Foo*>`?
    - What are the tradeoffs between using `std::vector<Foo>` vs
      `std::vector<Foo*>`?
    - Give an example where `std::vector<Foo>` is a better choice than
      `std::vector<Foo*>`
    - Give another example where the opposite is true
    - Can you create `std::vector<Foo&>`?
    - Can you create `std::vector<std::optional<Foo>>`?
    - What happens if your struct contains another struct?
    - What is the difference between a struct and a class?
