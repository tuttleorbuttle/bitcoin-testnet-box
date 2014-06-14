# bitcoin-testnet-box

This is a private, difficulty ~0.0000006 testnet in a box with blocktimes of ~20 seconds.

The master branch is meant for bitcoind v0.10.0. 
Check the tags for other bitcoind versions.

You don't have to have bitcoind installed on your system and in the path.

## Starting the testnet-box

This will start-up four nodes using the four datadirs `1`, `2`, `3`, you get it. They
will only connect to each other in order to remain an isolated private testnet.
You need at least two because otherwise the node won't generate blocks. Or so they say.

Node `1` will listen on port `19000`, allowing node `2` to connect to it.

Node `1` will listen on port `19001` and node `2` will listen on port `19011` 
for the JSON-RPC server.


When you run this first, run
```
$ make reindex
```
it should only take a few seconds and from then on you can run it with
```
$ make start
```
or
```
$ make start-gui
```

## Check the status of the nodes

```
$ make getinfo
bitcoind -datadir=1  getinfo
{
    "version" : 80000,
    "protocolversion" : 70001,
    "walletversion" : 60000,
    "balance" : 0.00000000,
    "blocks" : 55922,
    "connections" : 1,
    "proxy" : "",
    "difficulty" : 1.00000000,
    "testnet" : true,
    "keypoololdest" : 1362643839,
    "keypoolsize" : 101,
    "paytxfee" : 0.00000000,
    "errors" : ""
}
bitcoind -datadir=2  getinfo
{
    "version" : 80000,
    "protocolversion" : 70001,
    "walletversion" : 60000,
    "balance" : 0.00000000,
    "blocks" : 55922,
    "connections" : 1,
    "proxy" : "",
    "difficulty" : 1.00000000,
    "testnet" : true,
    "keypoololdest" : 1362643615,
    "keypoolsize" : 101,
    "paytxfee" : 0.00000000,
    "errors" : ""
}
```

## Generating blocks

Either use the binaries provided or make your own.
Just start mining, wait a second until you find a block
and stop mining again for some time as you would just be wasting your cpu.

You may be interested in making it easier to mine for testing purposes
on your own private testnet.
An [easy-mining](https://github.com/freewil/bitcoin/tree/easy-mining)
branch of bitcoind is maintained for this purpose. You will need to
compile it yourself. You should only use the output binary for your own
private testnet.

To start generating blocks:

```
$ make generate-true
```
  
To stop generating blocks:

```
$ make generate-false
```
  
## Stopping the testnet-box
  
```
$ make stop
```
  
To clean up any files created while running the testnet and restore to the 
original state:

```
$ make clean
```
