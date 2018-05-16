FROM haproxy:1.8-alpine

ENTRYPOINT ["/magic-entrypoint", "/docker-entrypoint.sh"]
CMD ["haproxy", "-f", "/usr/local/etc/haproxy/haproxy.cfg"]

RUN apk add --no-cache python3 &&\
    pip3 install --no-cache-dir dnspython

COPY magic-entrypoint.py /magic-entrypoint

ENV NAMESERVERS="8.8.8.8 8.8.4.4" \
    LISTEN=:100 \
    PRE_RESOLVE=0 \
    TALK=talk:100 \
    UDP=0 \
    VERBOSE=0

