# Builder
FROM golang:1.15 AS builder

WORKDIR /app
COPY . .

RUN go mod init hello
RUN go build -ldflags "-s -w" -o hello

# Prod
FROM scratch

WORKDIR /root/
COPY --from=builder /app/hello .

CMD ["./hello"]