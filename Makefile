CC=g++
CFLAGS_face=  -W `pkg-config --cflags --libs opencv`  -Iinclude -lswscale -lavdevice -lavformat -lavcodec -lavutil -lswresample -lz -lconfig++ -ltesseract `xml2-config --cflags --libs` -w 

PROGS_face:= face-detector

all:  $(PROGS_face) 

face-detector: src/face-detector.cc 
	$(CC) src/face-detector.cc -o  bin/$@  $(CFLAGS_face)
	src/make-bundle bin/$@  bin/$@.bundle

clean:
	rm -rf  bin/*

mrproper: clean
	rm -rf  bin/*
