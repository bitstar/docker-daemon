FROM ubuntu:zesty
MAINTAINER bitstarcoin <info@bitstarcoin.com>

RUN groupadd -r bitstarcoin && useradd -r -g bitstarcoin bitstarcoin

RUN sed -i 's/archive/old-releases/g' /etc/apt/sources.list && \
		sed -i 's/security\./old-releases\./g' /etc/apt/sources.list && \
        apt update && \
		apt install -y libdb5.3++-dev libminiupnpc-dev libboost-all-dev libssl1.0.0 wget && \
        wget --no-verbose https://github.com/bitstar/bitstarcoin/releases/download/v2.0.0.1-linux-daemon/bitstarcoind -O /home/bitstarcoin/bitstard && \
        chmod +x /home/bitstarcoin/bitstard && \
	chown bitstarcoin:bitstarcoin /home/bitstarcoin/bitstard
	
USER bitstarcoin
        
CMD ["/home/bitstarcoin/bitstard"]
