# [Caddy Container Image](https://github.com/marcbachmann/caddy) [![](https://img.shields.io/docker/automated/marcbachmann/caddy.svg)](https://hub.docker.com/r/marcbachmann/caddy)

This is a [caddy] image from [scratch].  
Check the [caddy docs] for more information how to configure it.

You can run it like that:
```
docker run -p 80:80 443:443 \
    -v /etc/Caddyfile:/etc/Caddyfile \
    marcbachmann/caddy:0.10.6-amd64-raw -conf /etc/Caddyfile
```

### Tags
- `latest-$arch-raw`, `0.10.6-$arch-$plugins`
- `latest-$arch-semi`, `0.10.6-$arch-$plugins`

Please replace `$arch` and `$plugins` with the keywords below:

e.g. `latest-amd64-raw`

### Architectures
- `386`
- `amd64`, this is usually what you want on a regular aws vm
- `arm5`
- `arm6`
- `arm7`
- `arm64`

### Plugins
- `raw`, no plugins
- `semi`, http.cache,http.cors,http.expires,http.filter,http.prometheus,http.realip,http.reauth

## SSL Certificates

Caddy mounts writes all ssl certificates into `/.caddy`. So if you want to persist them, you can mount a volume there.

e.g.
```
docker run -d --restart=always --name caddy -v /etc/caddy:/etc/caddy -v /tmp/caddy:/.caddy -p 80:80 -p 443:443 marcbachmann/caddy:0.10.6-amd64-semi caddy -conf /etc/caddy/Caddyfile
```

## Acknowledgements

Thanks to @joshix for the initial setup in https://github.com/joshix/caddybox

[caddy]: https://caddyserver.com
[caddy docs]: https://caddyserver.com/docs
[scratch]: https://hub.docker.com/_/scratch/
