FROM golang:1.15-alpine as builder
WORKDIR /go/src

COPY ./src/hello.go .

RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o hello .

FROM alpine:latest

WORKDIR /root/

COPY --from=builder /go/src/hello  .

CMD ["./hello"]