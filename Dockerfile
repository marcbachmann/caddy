FROM scratch
ADD ./tmp/caddy /bin/caddy
ADD ./ca-certificates.crt /etc/ssl/certs/ca-certificates.crt

EXPOSE 80 443 2015
ENTRYPOINT ["/bin/caddy"]
