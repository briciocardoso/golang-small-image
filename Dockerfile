# create an image to be used as a builder
FROM golang:1.20 AS builder
WORKDIR /src
COPY ./main.go /src
RUN go build main.go

# create a small image
FROM scratch
WORKDIR /
# copy only the executable to the container
COPY --from=builder /src /
CMD ["./main"]
