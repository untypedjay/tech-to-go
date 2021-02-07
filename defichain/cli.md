# DeFiChain Commands

## Accounts

## Blockchain

## Control

## Generating
### `generatetoaddress`
Mine blocks immediately to a specified address (before the RPC call returns).
* Syntax: `generatetoaddress nblocks "address" ( maxtries )`
**Arguments:**
1. nblocks (numeric, required): how many blocks are generated immediately
1. address (string, required): the address to send the newly generated DFI to
1. maxtries (numeric, optional, default=-1) how many iterations to try
```zsh
generatetoaddress 11 "myaddress"
```

## Masternodes

## Mining

## Network

## Poolpair

## Rawtransactions

## Spv

## Tokens

## Util

## Wallet

## Zmq
### `getzmqnotifications`
Returns information about the active ZeroMQ notifications.
```zsh
getzmqnotifications
```
