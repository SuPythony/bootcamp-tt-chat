#include "server/server.h"

int main() {
    chat::Server server{8080};

    server.start_listening();
    server.handle_connections();

    return 0;
}