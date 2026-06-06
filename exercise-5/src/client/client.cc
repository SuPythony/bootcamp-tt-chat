#include "client.h"
#include <string>
#include <netinet/in.h>
#include <unistd.h>
#include <sys/socket.h>
#include <arpa/inet.h>
#include "utils/utils.h"



chat::Client::Client(int kPort, const std::string& kServerAddres) : kPort{kPort}, kServerAddress{kServerAddres} {
  setup_socket();
  setup_address();       
}

chat::Client::~Client() {
  if (sock >= 0) close(sock);
}

void chat::Client::setup_socket() {
  sock = socket(AF_INET, SOCK_STREAM, 0);
  check_error(sock < 0, "Socket creation error\n");
}

void chat::Client::setup_address() {
  server_address.sin_family = AF_INET;
  server_address.sin_port = htons(kPort);
  int err_code = inet_pton(AF_INET, kServerAddress.c_str(), &server_address.sin_addr);
  check_error(err_code <= 0, "Invalid address/ Address not supported\n");
}

void chat::Client::connect_to_server() const {
  int err_code = connect(sock, (sockaddr *)&server_address, sizeof(server_address));
  check_error(err_code < 0, "Connection Failed\n");
}

void chat::Client::send_and_receive_message(const std::string& message) const {
  const int kBufferSize = 1024;
  char buffer[kBufferSize] = {0};
  send(sock, message.c_str(), message.size(), 0);
  std::cout << "Sent: " << message << "\n";
  ssize_t read_size = read(sock, buffer, kBufferSize);
  if (read_size > 0) {
    std::cout << "Received: " << buffer << "\n";
  } else if (read_size == 0) {
    std::cout << "Server closed connection.\n";
  } else {
    std::cerr << "Read error\n";
  }
}