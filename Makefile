
TAG:=`git describe --abbrev=0 --tags`
# TAG 是最新的 git tag 值
# 一般情况下 TAG == VERSION
VERSION:=0.5.0
LDFLAGS:=-X main.buildVersion=$(VERSION)

all: dist

dist-clean:
	rm -rf dist

dist: dist-clean
	mkdir -p dist/alpine-linux/amd64 && GOOS=linux GOARCH=amd64 go build -ldflags "$(LDFLAGS)" -a -tags netgo -installsuffix netgo -o dist/alpine-linux/amd64/drone-git
	mkdir -p dist/linux/amd64 && GOOS=linux GOARCH=amd64 go build -ldflags "$(LDFLAGS)" -o dist/linux/amd64/drone-git

dist-advance:
	mkdir -p dist/linux/armel && GOOS=linux GOARCH=arm GOARM=5 go build -ldflags "$(LDFLAGS)" -o dist/linux/armel/drone-git
	mkdir -p dist/linux/armhf && GOOS=linux GOARCH=arm GOARM=6 go build -ldflags "$(LDFLAGS)" -o dist/linux/armhf/drone-git
