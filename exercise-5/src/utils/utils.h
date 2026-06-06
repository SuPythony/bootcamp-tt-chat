#ifndef EXC_5_UTILS
#define EXC_5_UTILS

#include <string>
#include <iostream>
#include <stdexcept>

namespace chat {
  inline void check_error(bool test, const std::string& error_message) {
    if (test) {
      std::cerr << error_message << "\n";
      throw std::runtime_error{error_message};
    }
  }
}

#endif