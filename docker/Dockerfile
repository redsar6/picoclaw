FROM golang:1.25-alpine AS builder
RUN apk add --no-cache git make
WORKDIR /src
COPY go.mod go.sum ./
RUN go mod download
COPY . .
RUN make build

FROM alpine:3.23
RUN apk add --no-cache ca-certificates tzdata curl
COPY --from=builder /src/build/picoclaw /usr/local/bin/picoclaw
RUN addgroup -g 1000 picoclaw && \
    adduser -D -u 1000 -G picoclaw picoclaw
COPY --chown=picoclaw:picoclaw docker/entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
USER picoclaw
RUN /usr/local/bin/picoclaw onboard
ENTRYPOINT ["/entrypoint.sh"]
