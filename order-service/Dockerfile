FROM golang:1.25-alpine AS builder

WORKDIR /app

COPY go.mod go.sum ./


COPY . .
RUN go mod download
RUN CGO_ENABLED=0 GOOS=linux go build -o order-service ./cmd/main.go

FROM alpine:3.22

WORKDIR /root/
RUN apk add --no-cache ca-certificates tzdata
COPY --from=builder /app/order-service .
EXPOSE 8080
CMD ["./order-service"]
