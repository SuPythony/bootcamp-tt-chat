#include "server.h"
#include "utils/utils.h"
#include <unistd.h>
#include <sys/socket.h>
#include <netinet/in.h>

chat::Server::Server(int kPort) : kPort{kPort} {
    setup_socket();
    setup_address();
}

chat::Server::~Server() {
    if (sock >= 0) close(sock);
}

void chat::Server::setup_socket() {
  sock = socket(AF_INET, SOCK_STREAM, 0);
  check_error(sock < 0, "Socket creation error\n");
}

void chat::Server::setup_address() {
  address = create_address();
}

sockaddr_in chat::Server::create_address() {
  sockaddr_in addr;
  addr.sin_family = AF_INET;
  addr.sin_addr.s_addr = INADDR_ANY;
  addr.sin_port = htons(kPort);
  return addr;
}

void chat::Server::start_listening() {
  const int kSocketOptions = 1;
  // set_socket_options
  int err_code = setsockopt(sock, SOL_SOCKET, SO_REUSEADDR | SO_REUSEPORT, &kSocketOptions, sizeof(kSocketOptions));
  check_error(err_code < 0, "etsockopt() error\n");
  // bind_address_to_socket
  err_code = bind(sock, (sockaddr *)&address, sizeof(address));
  check_error(err_code < 0, "bind failed\n");
  // listen_on_socket
  err_code = listen(sock, 3);
  check_error(err_code < 0, "listen failed\n");
  std::cout << "Server listening on port " << kPort << "\n";
}

void chat::Server::handle_connections() {
  sockaddr_in client_address = create_address();
  socklen_t addr_size = sizeof(client_address);
  while (true) {
    int accepted_socket = accept(sock, (sockaddr*)&client_address, &addr_size);
    if (accepted_socket < 0) {
      std::cerr << "accept error\n";
      continue;
    }
    handle_accept(accepted_socket);
  }
}

void chat::Server::handle_accept(int client_socket) {
  const int kBufferSize = 1024;
  char buffer[kBufferSize] = {0};
  ssize_t valread = read(client_socket, buffer, kBufferSize);
  if (valread > 0) {
    std::cout << "Received: " << buffer << "\n";
    send(client_socket, buffer, valread, 0);
    std::cout << "Echo message sent\n";
  } else if (valread == 0) {
    std::cout << "Client disconnected.\n";
  } else {
    std::cerr << "Read error on client socket " << client_socket << "\n";
  }
  close(client_socket);
}