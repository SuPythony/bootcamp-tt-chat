#ifndef EXC_5_CLIENT
#define EXC_5_CLIENT

#include <string>
#include <netinet/in.h>
#include <unistd.h>
#include <sys/socket.h>
#include <arpa/inet.h>
#include "utils/utils.h"

namespace chat {
  class Client {
  public:
    Client(int kPort, const std::string& kServerAddress);

    ~Client();
    Client(Client& other) = default;
    Client& operator=(Client& other) = default;
    Client(Client&& other) = delete;
    Client& operator=(Client&& other) = delete;

    void connect_to_server() const ;
    void send_and_receive_message(const std::string& message) const;

  private:
    const int kPort;
    const std::string kServerAddress;
    int sock = -1;
    sockaddr_in server_address;

    void setup_socket();
    void setup_address();
  };
}

#endif