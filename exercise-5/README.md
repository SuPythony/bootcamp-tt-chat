# Exercise 5

**Update this README with your answers to the questions below.**

## Comparing File Changes

- What's an easy way to identify the changes in source code from one exercise
  to another?
<br> Using the `diff` terminal command.
    
## Using Classes

- Here is one way to separate out the code into multiple files
- Is this the best way to do it?
<br> A: There is no best way. But yes, this is a good way to do so. Creates namespaces to separate concerns. Another thing that could be done is to use classes to model the client and server.
- What are the advantages and disadvantages?
<br> A: Advantage: Safe code, no name collisions. Disadvantage: Higher boilerplate (long namespace name), difficult to read.

## Introduction to Namespace

- There are different ways namespace is being used in this exercise
<br> (`using namespace <name>`, `namespace <var> = <name>`)
- Which way is better? What are the advantages and disadvantages?
<br> A: In complex codebases, `namespace <var> = <name>` is arguably better as it does not bring the names into immediate scope, and instead lets us use longer namespaces with shorter names. `using namespace <name>` brings names into the current scope and might result in name collisions.

## Abstracting Code into Classes

- Abstract the client and server logic into a `Client` and `Server` class
- **Note**: You don't have to use the code in this exercise as a starting point
- You can use the code you wrote from previous exercises instead
- How should you divide the code into files?
<br> A: 2 files (.cc and .h) for client, 2 for server, 1 (.h) for utils, and then the 2 main tcp_echo_*.cc files.
- What namespace and directory structure should you use? Why?
<br> A: I used a single namespace `chat` to contain both the classes and the `check_error` function. I created a folder for each .cc and .h pair.

## Programming Sense of Taste

- How do you judge what makes a particular choice of namespace and directory
  structure? 
<br> A: Depends on the scale of the project. For small projects like this one, I'll use the namespace and directory structure I used here (single namespace, file pairs in directories). For a larger project I might choose to divide it into multiple namespaces and have a single include directry for all the .h files.
- How do you judge what makes a good naming convention or programming style?
<br> A: Whatevr feels natural, convenient and expressable enough to me. Don't use really long variable names. Don't abstract every single thing to a function.

## "Senses" in Programming

- Have you ever heard of programmers referring to "code smells"? How can code
  smell?
<br> A: Yes, I have heard of code smells. Code 'smells' when the code does not look good and uses a lot of bad conventions and design choices.
- What does it mean to have a sense of taste in programming? How can code
  taste?
<br> A: Each person likes to follow different conventions and writing styles. This is the sense of taste. You might like putting opening braces after the function declaration or on the next line.
- Is there an analogue for every sense?
<br> A: I can see code. Have a taste and smell of code too. I can also feel what the code's doing and how the machine might feel executing it (a lot of cache misses -> a lot of work for the machine). Just can't touch code as much as I would like to.
- What other code senses can you think of?
<br> A: The sense of intuition, how the code might perform and knowing is it correct before executing.
- How many senses do humans have?
<br> A: 5 basic senses + several other internal senses.
- When would you want to see something before you touch it?
<br> Always.
- When would you want to touch something before you see it?
<br> Never.