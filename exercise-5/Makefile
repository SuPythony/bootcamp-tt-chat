CXX := g++
CXXFLAGS := -std=c++20 -Wall -Wextra -I./src/

BUILD_DIR := build
SRC_DIR := src

all: $(BUILD_DIR)/client $(BUILD_DIR)/server

$(BUILD_DIR)/client: $(BUILD_DIR)/src/tcp_echo_client.o $(BUILD_DIR)/src/client/client.o
	$(CXX) $(CXXFLAGS) -o $@ $^

$(BUILD_DIR)/server: $(BUILD_DIR)/src/tcp_echo_server.o $(BUILD_DIR)/src/server/server.o
	$(CXX) $(CXXFLAGS) -o $@ $^

$(BUILD_DIR)/src/tcp_echo_client.o: $(SRC_DIR)/tcp_echo_client.cc $(SRC_DIR)/client/client.h $(SRC_DIR)/utils/utils.h
	mkdir -p $(BUILD_DIR)/src
	$(CXX) $(CXXFLAGS) -c -o $@ $<

$(BUILD_DIR)/src/tcp_echo_server.o: $(SRC_DIR)/tcp_echo_server.cc $(SRC_DIR)/server/server.h $(SRC_DIR)/utils/utils.h
	mkdir -p $(BUILD_DIR)/src
	$(CXX) $(CXXFLAGS) -c -o $@ $<

$(BUILD_DIR)/src/client/client.o: $(SRC_DIR)/client/client.cc $(SRC_DIR)/client/client.h $(SRC_DIR)/utils/utils.h
	mkdir -p $(BUILD_DIR)/src/client
	$(CXX) $(CXXFLAGS) -c -o $@ $<

$(BUILD_DIR)/src/server/server.o: $(SRC_DIR)/server/server.cc $(SRC_DIR)/server/server.h $(SRC_DIR)/utils/utils.h
	mkdir -p $(BUILD_DIR)/src/server
	$(CXX) $(CXXFLAGS) -c -o $@ $<

clean:
	rm -rf build

.PHONY: all clean