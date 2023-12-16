FROM golang:1.21-alpine as base
ENV ROOT=/go/src/app
WORKDIR ${ROOT}
COPY ./app/go.mod ./app/go.sum ./app/main.go ${ROOT}/
RUN go mod download
RUN go build -o /app/main ${ROOT}/main.go
CMD ["/app/main"]
