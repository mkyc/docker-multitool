FROM alpine:3.18.0

# `curl` is required to make http requests
# `jq` is required to parse and format JSON
# `bash` is required to allow stnadardized scripting in bash
# `git` is required to interact with git repositories
# `coreutils` is required for using functions like `date -d`
RUN apk update && \
    apk add --no-cache curl jq bash git coreutils zip && \
    rm -rf /var/cache/apk/*

CMD [ "bash" ]
