# Builder
FROM golang:1.15 AS builder

WORKDIR /app
COPY . .

RUN go mod init hello
RUN go build -o hello

# Prod
FROM alpine:latest

WORKDIR /root/
COPY --from=builder /app/hello .

CMD ["./hello"]