FROM golang:1.15-alpine

COPY ./src/hello.go /go/src

CMD ["go", "run", "/go/src/hello.go"]