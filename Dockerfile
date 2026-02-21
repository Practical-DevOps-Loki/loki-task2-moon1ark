FROM golang:1.21-alpine AS build-stage

WORKDIR /app

COPY ./ ./

RUN CGO_ENABLED=0 GOOS=LINUX go mod download && go build -o webapp
RUN go build -o main .
EXPOSE 8080
CMD ["./main"]