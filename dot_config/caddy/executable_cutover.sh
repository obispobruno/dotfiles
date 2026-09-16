#!/usr/bin/env bash
# Recreate the `caddy` container from caddy-duckdns:2 with the DuckDNS token,
# then load the TLS config while preserving the current wt:* routes.
# Usage: cutover.sh [staging|production]
set -euo pipefail
MODE="${1:-staging}"
ENVFILE="$HOME/.config/caddy/duckdns.env"
CFG="$HOME/.config/caddy/wt-tls.json"
ADMIN="http://localhost:2019"
[ -f "$ENVFILE" ] || { echo "missing $ENVFILE" >&2; exit 1; }

routes=$(curl -sf "$ADMIN/config/apps/http/servers/wt/routes" || echo '[]')
[ "$routes" = "null" ] && routes='[]'

if [ "$(docker inspect caddy --format '{{.Config.Image}}' 2>/dev/null)" != "caddy-duckdns:2" ]; then
  docker rm -f caddy >/dev/null
  docker run -d --name caddy --network host --restart unless-stopped \
    --env-file "$ENVFILE" -v caddy_data:/data -v caddy_config:/config \
    caddy-duckdns:2 caddy run --resume >/dev/null
  for i in $(seq 1 30); do curl -sf "$ADMIN/config/" >/dev/null && break; sleep 1; done
fi

ca="https://acme-staging-v02.api.letsencrypt.org/directory"
[ "$MODE" = "production" ] && ca="https://acme-v02.api.letsencrypt.org/directory"
jq --argjson routes "$routes" --arg ca "$ca" \
  '.apps.http.servers.wt.routes = $routes | .apps.tls.automation.policies[0].issuers[0].ca = $ca' "$CFG" \
  | curl -sf -X POST -H 'Content-Type: application/json' "$ADMIN/load" -d @-
echo "loaded ($MODE); routes kept: $(echo "$routes" | jq -r '[.[]."@id"] | join(", ")')"
