FROM swift:6.0-jammy AS build
WORKDIR /app
COPY main.swift .
RUN swiftc -O -static-stdlib main.swift -o main

FROM ubuntu:22.04
WORKDIR /app
COPY --from=build /app/main ./
ENTRYPOINT ["./main"]
