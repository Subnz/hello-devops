# Étape de build
FROM golang:1.25.1-trixie AS builder
WORKDIR /app
COPY app/ .
RUN go build -o myapp .

# Étape finale
FROM debian:trixie
WORKDIR /app
COPY --from=builder /app/myapp .
EXPOSE 8080
CMD ["./myapp"]
