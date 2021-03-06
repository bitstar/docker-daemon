Bitstar Coin V2.0.0.1 Linux Node
========

This image is to run Bitstar daemon as a node but if you add your wallet.dat into /home/bitstarcoin/.bitstarcoin it can also be a personal wallet.

## Run this Image from command line

```
docker run -d --name bitstarcoin -p 19534:19534 -v bitstarcoin:/home/bitstarcoin index.docker.io/bitstarcoin/linux-node:latest
```


## Or with docker-compose.yml

```yaml
version: '2'
services:
  bitstar:
    image: bitstarcoin/linux-node:latest
    restart: always
    networks:
      - bridge
    ports:
      - 19534:19534
    volumes:
      - bitstarcoin:/home/bitstarcoin/
volumes:
  bitstarcoin:
    name: bitstarcoin
    driver: local
```

## You can then call the wallets functions via docker exec

```
docker exec -i -t bitstarcoin /home/bitstarcoin/bitstard getinfo
```

