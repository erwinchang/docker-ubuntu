all: build

build:
	@docker build --tag=erwinchang/ubuntu-build:latest .

release: build
	@docker build --tag=erwinchang/ubuntu-build:$(shell cat VERSION) .
