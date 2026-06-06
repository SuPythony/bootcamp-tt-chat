#ifndef EXC_5_SERVER
#define EXC_5_SERVER

#include "utils/utils.h"
#include <unistd.h>
#include <sys/socket.h>
#include <netinet/in.h>

namespace chat {
  class Server {
  public:
    Server(int kPort);

    ~Server();
    Server(Server& other) = default;
    Server& operator=(Server& other) = default;
    Server(Server&& other) = delete;
    Server& operator=(Server&& other) = delete;

    void start_listening();
    void handle_connections();

  private:
    const int kPort;
    int sock = -1;
    sockaddr_in address;
    void setup_socket();
    sockaddr_in create_address();
    void setup_address();
    void handle_accept(int client_socket);
  };
}

#endif