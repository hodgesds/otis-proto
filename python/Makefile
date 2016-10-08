CUR_TAG = $(shell git describe --abbrev=0 --tags 2>/dev/null || (echo '0.0.0') )
TAG_LIST = $(subst ., , $(CUR_TAG))
MAJOR = $(word 1, $(TAG_LIST))
MINOR = $(word 2, $(TAG_LIST))
REV = $(word 3, $(TAG_LIST))

all: otis/proto/otis_pb2.py setup.py

clean:
	rm -rf otis/proto
	rm -rf setup.py
	rm -rf build dist *egg-info*

setup: setup.py 

setup.py:
	@$(shell cp setup.py.template setup.py)
	$(shell sed -i -e "s/\$$TAG/$(MAJOR)\.$(MINOR)\.$(REV)/g" setup.py)


.PHONY: publish
publish: otis/proto/otis_pb2.py setup
	python setup.py sdist upload -r pypi

otis/proto/otis_pb2.py:
	mkdir -p otis/proto/;        \
	python                       \
	-m grpc.tools.protoc         \
	-I ../protos                 \
	--python_out=otis/proto      \
	--grpc_python_out=otis/proto \
	../protos/otis.proto
	$(shell mkdir -p otis/proto; echo -e \
		"from otis_pb2 import *\nVERSION = \"$(CUR_TAG)\"" > otis/proto/__init__.py)
