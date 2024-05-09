FROM alpine/java:21-jdk as builder
COPY oom/OOMCrash.java /tmp/OOMCrash.java
RUN javac /tmp/OOMCrash.java


FROM alpine:3.18.0 as base

# `curl` is required to make http requests
# `jq` is required to parse and format JSON
# `bash` is required to allow stnadardized scripting in bash
# `git` is required to interact with git repositories
# `coreutils` is required for using functions like `date -d`
RUN apk update && \
    apk add --no-cache curl jq bash git coreutils zip && \
    rm -rf /var/cache/apk/*

CMD [ "bash" ]

FROM alpine/java:21-jdk as oom

RUN mkdir -p /app/dumps
COPY --from=builder /tmp/OOMCrash.class /app/OOMCrash.class
COPY --chmod=755 oom/oom.sh /app/oom.sh
CMD [ "/app/oom.sh" ]

#just to have build backward compatibility
FROM base
