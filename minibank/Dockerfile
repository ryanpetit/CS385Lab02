FROM alpine as builder
RUN apk update && apk add git && apk add go gcc libc-dev
#RUN wget https://dl.google.com/go/go1.10.3.linux-amd64.tar.gz
#RUN tar -C /usr/local -xvzf go1.10.3.linux-amd64.tar.gz
#RUN rm go1.10.3.linux-amd64.tar.gz
RUN mkdir ~/go
ENV GOPATH /go
ENV PATH $GOPATH/bin:/usr/local/go/bin:$PATH
RUN mkdir -p "$GOPATH/src" "$GOPATH/bin" && chmod -R 777 "$GOPATH"
WORKDIR $GOPATH
COPY * /go/src/
WORKDIR $GOPATH/src
RUN pwd
#RUN go version
RUN go get -t minibank
RUN go install minibank
WORKDIR ../bin
CMD ["./minibank"]


