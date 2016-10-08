all: src/main/org/otis/proto/Mmal.java

clean:
	rm -rf src/*

src/main/org/otis/proto/Mmal.java:
	mkdir -p src/main/org/otis/proto; \
	protoc -I ../protos --java_out=src/main ../protos/otis.proto

