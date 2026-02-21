FROM golang:1.21-alpine AS builder

WORKDIR /app
COPY . .
RUN go mod download && go build -o webapp main.go

FROM alpine:latest
WORKDIR /root/
COPY --from=builder /app/webapp .

EXPOSE 8080

CMD ["./webapp"]
