# Caddy 2 with the DuckDNS DNS provider, for Let's Encrypt DNS-01 wildcard certs
# (this box is not reachable from the internet, so HTTP-01 cannot work).
FROM caddy:2-builder AS builder
RUN xcaddy build --with github.com/caddy-dns/duckdns
FROM caddy:2
COPY --from=builder /usr/bin/caddy /usr/bin/caddy
