#!/usr/bin/env bash

set -euo pipefail

SOURCE="https://raw.githubusercontent.com/StevenBlack/hosts/master/alternates/social-only/hosts"
OUTPUT="social-vitta.txt"

TMP="$(mktemp)"

curl -fsSL "$SOURCE" -o "$TMP"

{
    echo "# Vitta Social Blocklist"
    echo "# Baseada em StevenBlack social-only"
    echo "# WhatsApp permitido"
    echo "# YouTube permitido"
    echo "# Gerado automaticamente em: $(date -u '+%Y-%m-%d %H:%M:%S UTC')"
    echo
} > "$OUTPUT"

awk '
    /^[[:space:]]*#/ { next }
    NF < 2 { next }
    $1 != "0.0.0.0" { next }

    {
        host=$2

        if (host ~ /(^|\.)whatsapp\.com$/)
            next

        if (host ~ /(^|\.)whatsapp\.net$/)
            next

        if (host ~ /^whatsapp-cdn-.*\.fbcdn\.net$/)
            next

        if (host ~ /(^|\.)youtube\.com$/)
            next

        if (host ~ /(^|\.)youtu\.be$/)
            next

        if (host ~ /(^|\.)googlevideo\.com$/)
            next

        if (host ~ /(^|\.)ytimg\.com$/)
            next

        if (host ~ /(^|\.)youtubei\.googleapis\.com$/)
            next

        if (host ~ /(^|\.)youtube\.googleapis\.com$/)
            next

        print "0.0.0.0 " host
    }
' "$TMP" | sort -u >> "$OUTPUT"

rm -f "$TMP"

echo "Arquivo gerado: $OUTPUT"
echo "Quantidade de dominios: $(grep -c '^0\.0\.0\.0 ' "$OUTPUT")"
