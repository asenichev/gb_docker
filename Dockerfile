FROM golang as build
LABEL maintainer="artem.senichev@gmail.com"
RUN mkdir /app
COPY . /app
WORKDIR /app
RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o server .

FROM scratch
COPY --from=build /app/server /
EXPOSE 8000
CMD ["/server"]