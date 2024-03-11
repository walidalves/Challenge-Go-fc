FROM golang:alpine as builder

WORKDIR /app

COPY . .

RUN go mod init myapp

RUN go build -o main .

FROM scratch

WORKDIR /app

COPY --from=builder /app/main .

CMD ["./main"]
