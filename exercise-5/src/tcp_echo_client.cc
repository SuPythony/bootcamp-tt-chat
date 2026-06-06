#include "client/client.h"
#include <string>
#include <iostream>

std::string read_args(int argc, char *argv[]) {
  std::string message = "Hello from client";
  if (argc == 1) {
    std::cout << "Usage: " << argv[0] << " <message>\n";
    exit(EXIT_FAILURE);
  }
  if (argc > 1) {
    message = argv[1];
  }
  return message;
}

int main(int argc, char *argv[]) {
  std::string message = read_args(argc, argv);
  chat::Client client{8080, "127.0.0.1"};
  
  client.connect_to_server();
  client.send_and_receive_message(message);

  return 0;
}