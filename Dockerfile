# Build
FROM golang:1.18-alpine as builder
# RUN apk --no-cache add git gcc g++ musl-dev
RUN go install github.com/reedom/oapi-codegen/cmd/oapi-codegen@v1.11.0+r6

# Run
FROM alpine:3.16
COPY --from=builder /go/bin/oapi-codegen /bin/oapi-codegen
RUN mkdir -p /src

ENTRYPOINT ["/bin/oapi-codegen"]

WORKDIR "/src"
