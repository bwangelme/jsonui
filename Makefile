.PHONY: build, install, installdep, cover

default: build

installdep:
	@go get -u golang.org/x/lint/golint

build:
	@go fmt
	@go vet
	@golint
	@go test ./...
	@go build

install: build
	cp jsonui ~/bin/

cover:
	@go test ./... -coverprofile=coverage.out
	@go tool cover -func=coverage.out
	@go tool cover -html=coverage.out
	@rm coverage.out
