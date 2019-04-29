 .PHONY: enable-race
enable-race:
	$(eval RACE = -race)

.PHONY: build
build: wssvr wsclt

.PHONY: wssvr
wssvr:
	go build $(RACE) -o bin/wssvr ./wssvr

.PHONY: wsclt
wsclt:
	go build $(RACE) -o bin/wsclt ./wsclt

.PHONY: run
run: build kill
	sleep 0.5
	./bin/wssvr &
	sleep 0.5
	./bin/wsclt

.PHONY: kill
kill:
	-killall wsclt
	-killall wssvr

.PHONY: clean
clean:
	rm bin/*
	tree -L 3

.PHONY: test
test:
	go test $(RACE) ./...
