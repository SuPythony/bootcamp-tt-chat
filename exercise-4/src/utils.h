#ifndef EXC_4_UTILS
#define EXC_4_UTILS

#include <string>
#include <iostream>
#include <sys/socket.h>

void check_error(bool test, std::string error_message);
int create_socket();

#endif