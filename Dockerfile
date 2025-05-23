FROM --platform=$BUILDPLATFORM alpine AS builder

RUN apk --no-cache add go

WORKDIR /asd/

COPY /main.go ./

RUN go build -o asd main.go

FROM alpine

COPY --from=builder /asd/asd /

ENTRYPOINT []

CMD ["sleep", "3600"]
