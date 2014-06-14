BITCOIND=./bitcoind
BITCOINGUI=./bitcoin-qt
B1_FLAGS=-testnet -externalip=127.0.0.1
B2_FLAGS=-testnet -externalip=127.0.0.1
B3_FLAGS=-testnet -externalip=127.0.0.1
B4_FLAGS=-testnet -externalip=127.0.0.1
B1=-datadir=1 $(B1_FLAGS)
B2=-datadir=2 $(B2_FLAGS)
B3=-datadir=3 $(B3_FLAGS)
B4=-datadir=4 $(B4_FLAGS)
DELAY=0

start:
	$(BITCOIND) $(B1) -daemon
	sleep $(DELAY)
	$(BITCOIND) $(B2) -daemon
	sleep $(DELAY)
	$(BITCOIND) $(B3) -daemon
	sleep $(DELAY)
	$(BITCOIND) $(B4) -daemon

start-gui:
	$(BITCOINGUI) $(B1) &
	sleep $(DELAY)
	$(BITCOINGUI) $(B2) &
	sleep $(DELAY)
	$(BITCOINGUI) $(B3) &
	sleep $(DELAY)
	$(BITCOINGUI) $(B4) &

reindex:
	$(BITCOINGUI) $(B1) -reindex &
	sleep $(DELAY)
	$(BITCOINGUI) $(B2) -reindex &
	sleep $(DELAY)
	$(BITCOINGUI) $(B3) -reindex &
	sleep $(DELAY)
	$(BITCOINGUI) $(B4) -reindex &

generate-true:
	$(BITCOIND) $(B1) setgenerate true

generate-false:
	$(BITCOIND) $(B1) setgenerate false

getinfo:
	$(BITCOIND) $(B1) getinfo
	sleep $(DELAY)
	$(BITCOIND) $(B2) getinfo
	$(BITCOIND) $(B3) getinfo
	$(BITCOIND) $(B4) getinfo

stop:
	$(BITCOIND) $(B1) stop
	$(BITCOIND) $(B2) stop
	$(BITCOIND) $(B3) stop
	$(BITCOIND) $(B4) stop

clean:
	git clean -fd 1/testnet3
	git clean -fd 2/testnet3
	git clean -fd 3/testnet3
	git clean -fd 4/testnet3
	git checkout -- 1/testnet3
	git checkout -- 2/testnet3
	git checkout -- 3/testnet3
	git checkout -- 4/testnet3
