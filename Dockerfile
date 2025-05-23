FROM --platform=$BUILDPLATFORM golang:alpine AS builder
ARG TARGETOS
ARG TARGETARCH

WORKDIR /asd/

COPY /main.go ./

RUN CGO_ENABLED=0 GOOS=${TARGETOS:-linux} GOARCH=${TARGETARCH} go build -a -o asd main.go

FROM alpine

COPY --from=builder /asd/asd /

ENTRYPOINT []

CMD ["sleep", "3600"]
