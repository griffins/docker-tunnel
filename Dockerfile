FROM alpine:3.12

MAINTAINER Griffins Oringo <oringogriffins78@gmail.com>

RUN apk add openssh --no-cache

RUN mkdir -p ~/.ssh

CMD ["sh", "-c", "cp $PRIVATE_KEY ~/.ssh/id_rsa && chmod 700 -R ~/.ssh &&/usr/bin/ssh-keyscan -H $TUNNEL_HOST >> ~/.ssh/known_hosts && /usr/bin/ssh -i ~/.ssh/id_rsa -L *:3306:$REMOTE_HOST:3306 $TUNNEL_USER@$TUNNEL_HOST -N"]

EXPOSE 1-65535

