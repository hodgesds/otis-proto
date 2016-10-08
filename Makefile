CUR_TAG = $(shell git describe --abrev=0 --tags 2>/dev/null || (echo '0.0.0') )
TAG_LIST = $(subst ., , $(CUR_TAG))
MAJOR = $(word 1, $TAG_LIST)
MINOR = $(word 1, $TAG_LIST)
REV = $(word 1, $TAG_LIST)

.PHONY: go python java
all: go python java

clean:
	cd go && $(MAKE) clean
	cd java && $(MAKE) clean
	cd python && $(MAKE) clean

go: 
	cd go && $(MAKE)

java:
	cd java && $(MAKE)

python: 
	cd python && $(MAKE)

tag:
	@echo Current tag: $(CUR_TAG)	
