FROM golang:1.19.0-bullseye as builder
# Build Delve
RUN --mount=type=cache,mode=0755,target=/go/pkg/mod go install github.com/go-delve/delve/cmd/dlv@v1.9.1
# === Middleware ===
ADD . /app
WORKDIR /app
RUN mkdir -p /app/dist
RUN --mount=type=cache,mode=0755,target=/go/pkg/mod go mod vendor
RUN go build -o /app/dist/Debuging


# == Base Image ==
FROM debian:bullseye

WORKDIR /usr/app
COPY --from=builder /go/bin/dlv /usr/bin/
COPY --from=builder /app/dist/Debuging /usr/app/

EXPOSE 8080 2345
#CMD ["dlv", "--listen=:2345", "--headless=true", "--api-version=2", "--accept-multiclient", "exec", "/usr/app/Debuging"]
CMD ["/usr/app/Debuging"]