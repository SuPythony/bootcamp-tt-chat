CXX := g++
CXXFLAGS := -std=c++20 -Wall -Wextra

BUILD_DIR := build
SRC_DIR := src

all: $(BUILD_DIR)/client $(BUILD_DIR)/server

$(BUILD_DIR)/client: $(BUILD_DIR)/client.o
	$(CXX) -o $(BUILD_DIR)/client $<

$(BUILD_DIR)/server: $(BUILD_DIR)/server.o
	$(CXX) -o $(BUILD_DIR)/server $<

$(BUILD_DIR)/client.o: $(SRC_DIR)/tcp_echo_client.cc
	mkdir -p $(BUILD_DIR)
	$(CXX) $(CXXFLAGS) -c -o $(BUILD_DIR)/client.o $<

$(BUILD_DIR)/server.o: $(SRC_DIR)/tcp_echo_server.cc
	mkdir -p $(BUILD_DIR)
	$(CXX) $(CXXFLAGS) -c -o $(BUILD_DIR)/server.o $<

clean:
	rm -rf build

.PHONY: all clean