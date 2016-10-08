CUR_TAG = $(shell git describe --abbrev=0 --tags 2>/dev/null || (echo '0.0.0') )

all: github.com/hodgesds/otis/otis.pb.go  github.com/hodgesds/otis/proto/version.go

github.com/hodgesds/otis/otis.pb.go:
	protoc -I ../protos --go_out=plugins=grpc:. ../protos/otis.proto
	@go fmt ./...

github.com/hodgesds/otis/proto/version.go:
	$(shell echo -e "package proto\nvar VERSION string\nfunc init(){ VERSION = \"$(CUR_TAG)\" }\nvar VERSION string" > \
		github.com/hodgesds/otis/proto/version.go )
	@go fmt ./...

clean:
	rm -rf github.com/
