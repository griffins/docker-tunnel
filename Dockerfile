FROM alpine:3.12

MAINTAINER Griffins Oringo <oringo.griffins@codeshares.io>

RUN apk add openssh --no-cache

RUN mkdir -p ~/.ssh

CMD ["sh", "-c", "chmod 700 $PRIVATE_KEY &&/usr/bin/ssh-keyscan -H $TUNNEL_HOST >> ~/.ssh/known_hosts && /usr/bin/ssh -i $PRIVATE_KEY -L 3306:$REMOTE_HOST:3306 $TUNNEL_USER@$TUNNEL_HOST -N"]
