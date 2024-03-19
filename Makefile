CXXFLAGS += -O2
all: subuid-register
subuid-register: subuid-register.cpp xxhash64.h
	g++ -O2 -o subuid-register subuid-register.cpp
