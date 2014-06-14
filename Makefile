BITCOIND=./bitcoind
BITCOINGUI=./bitcoin-qt
B1_FLAGS=-testnet
B1=-datadir=1 $(B1_FLAGS)

start:
	$(BITCOIND) $(B1) -daemon

start-gui:
	$(BITCOINGUI) $(B1) &

reindex:
	$(BITCOINGUI) $(B1) -reindex &

generate-true:
	$(BITCOIND) $(B1) setgenerate true

generate-false:
	$(BITCOIND) $(B1) setgenerate false

getinfo:
	$(BITCOIND) $(B1) getinfo

stop:
	$(BITCOIND) $(B1) stop

clean:
	git clean -fd 1/testnet3
	git checkout -- 1/testnet3
