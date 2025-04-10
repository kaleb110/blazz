# Build stage
FROM golang:1.23.4-alpine3.21 AS builder
WORKDIR /app
COPY go.mod go.sum ./
RUN go mod download
COPY . ./
RUN GOOS=linux go build -o server main.go

# Final stage
FROM alpine:3.20 AS final
WORKDIR /app
COPY --from=builder /app/server /app/
EXPOSE 8100
CMD ["/app/server"]