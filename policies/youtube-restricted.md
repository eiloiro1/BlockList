# YouTube Restricted Mode

Status: EM HOMOLOGAÇÃO

## Objetivo

Aplicar Restricted Mode de forma organizacional através do Pi-hole.

## Endpoint Strict

IPv4:
216.239.38.120

IPv6:
2001:4860:4802:32::78

Destino:
restrict.youtube.com

## CNAMEs atualmente configurados

- youtube.com
- www.youtube.com
- m.youtube.com
- youtubei.googleapis.com
- youtube.googleapis.com
- www.youtube-nocookie.com

Todos apontando para:

restrict.youtube.com

## Resultado atual

- DNS do Windows resolve corretamente para restrict.youtube.com
- comentários do YouTube ficam indisponíveis
- funcionalmente o Restricted Mode aparenta estar aplicado
- página check_content_restrictions ainda informa DNS desativado

## Status

Pendente validação final.
