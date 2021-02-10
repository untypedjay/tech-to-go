# DeFiChain Commands

## Accounts
### `accounthistorycount`
### `accounttoaccount`
### `accounttoutxos`
### `getaccount`
### `gettokenbalances`
### `listaccounthistory`
### `listaccounts`
### `listcommunitybalances`
### `sendtokenstoaddress`
### `utxostoaccount`

## Blockchain
### `clearmempool`
### `getbestblockhash`
### `getblock`
### `getblockchaininfo`
### `getblockcount`
### `getblockfilter`
### `getblockhash`
### `getblockheader`
### `getblockstats`
### `getchaintips`
### `getchaintxstats`
### `getdifficulty`
### `getgov`
### `getmempoolancestors`
### `getmempooldescendants`
### `getmempoolentry`
### `getmempoolinfo`
### `getrawmempool`
### `gettxout`
### `gettxoutproof`
### `gettxoutsetinfo`
### `isappliedcustomtx`
### `preciousblock`
### `pruneblockchain`
### `savemempool`
### `scantxoutset`
### `setgov`
### `verifychain`
### `verifytxoutproof`

## Control
### `getmemoryinfo`
### `getrpcinfo`
### `help`
### `logging`
### `stop`
### `uptime`

## Generating
### `generatetoaddress`
Mine blocks immediately to a specified address (before the RPC call returns).

**Syntax:**
```zsh
generatetoaddress nblocks "address" ( maxtries )
```

**Arguments:**
1. nblocks (numeric, required): how many blocks are generated immediately
1. address (string, required): the address to send the newly generated DFI to
1. maxtries (numeric, optional, default=-1) how many iterations to try

**Examples:**
```zsh
generatetoaddress 11 "myaddress"
```

## Masternodes
### `createmasternode`
Creates (and submits to local node and network) a masternode creation transaction with given owner and operator addresses, spending the given inputs.
The last optional argument (may be empty array) is an array of specific UTXOs to spend.

**Syntax:**
```zsh
createmasternode "ownerAddress" ("operatorAddress" [{"txid":"hex","vout":n},...] )
```

**Arguments:**
1. ownerAddress (string, required): any valid address for keeping collateral amount
1. operatorAddress (string, optional): masternode operator auth address
1. inputs (json array, optional): transaction IDs and the output numbers

**Examples:**
```zsh
createmasternode ownerAddress operatorAddress '[{"txid":"id","vout":0}]'
```
### `getmasternode`
### `listcriminalproofs`
### `listmasternodes`
### `resignmasternode`

## Mining
### `getblocktemplate`
### `getmintinginfo`
### `getnetworkhashps`
### `prioritisetransaction`
### `submitblock`
### `submitheader`

## Network
### `addnode`
### `clearbanned`
### `disconnectnode`
### `getaddednodeinfo`
### `getconnectioncount`
### `getnettotals`
### `getnetworkinfo`
### `getnodeaddresses`
### `getpeerinfo`
### `listbanned`
### `ping`
### `setban`
### `setnetworkactive`

## Poolpair
### `addpoolliquidity`
### `createpoolpair`
### `getpoolpair`
### `listpoolpairs`
### `listpoolshares`
### `poolswap`
### `removepoolliquidity`
### `testpoolswap`
### `updatepoolpair`

## Rawtransactions
### `analyzepsbt`
### `combinepsbt`
### `combinerawtransaction`
### `converttopsbt`
### `createpsbt`
### `createrawtransaction`
### `decodepsbt`
### `decoderawtransaction`
### `decodescript`
### `finalizepsbt`
### `fundrawtransaction`
### `getrawtransaction`
### `joinpsbts`
### `sendrawtransaction`
### `signrawtransaction`
### `signrawtransactionwithkey`
### `testmempoolaccept`
### `utxoupdatepsbt`

## Spv
### `spv_createanchor`
### `spv_createanchortemplate`
### `spv_estimateanchorcost`
### `spv_gettxconfirmations`
### `spv_listanchorauths`
### `spv_listanchorrewardconfirms`
### `spv_listanchorrewards`
### `spv_listanchors`
### `spv_rescan`
### `spv_sendrawtx`
### `spv_splitutxo`
### `spv_syncstatus`

## Tokens
### `createtoken`
### `getcustomtx`
### `gettoken`
### `listtokens`
### `minttokens`
### `updatetoken`

## Util
### `createmultisig`
### `deriveaddresses`
### `estimatesmartfee`
### `getdescriptorinfo`
### `signmessagewithprivkey`
### `validateaddress`
### `verifymessage`

## Wallet
### `abandontransaction`
### `abortrescan`
### `addmultisigaddress`
### `backupwallet`
### `bumpfee`
### `createwallet`
### `dumpprivkey`
### `dumpwallet`
### `encryptwallet`
### `getaddressesbylabel`
### `getaddressinfo`
### `getbalance`
### `getbalances`
### `getnewaddress`
### `getrawchangeaddress`
### `getreceivedbylabel`
### `gettransaction`
### `getunconfirmedbalance`
### `getwalletinfo`
### `importaddress`
### `importmulti`
### `importprivkey`
### `importprunedfunds`
### `importpubkey`
### `importwallet`
### `keypoolrefill`
### `listaddressgroupings`
### `listlabels`
### `listlockunspent`
### `listreceivedbyaddress`
### `listrecievedbylabel`
### `listsinceblock`
### `listtransactions`
### `listunspent`
### `listwalletdir`
### `listwallets`
### `loadwallet`
### `lockunspent`
### `removeprunedfunds`
### `rescanblockchain`
### `sendmany`
### `sendtoaddress`
### `sethdseed`
### `setlabel`
### `settxfee`
### `setwalletflag`
### `signmessage`
### `signrawtransactionwithwallet`
### `walletcreatefundedpsbt`
### `walletlock`
### `walletpassphrase`
### `walletpassphrasechange`
### `walletprocesspsbt`

## Zmq
### `getzmqnotifications`
Returns information about the active ZeroMQ notifications.
```zsh
getzmqnotifications
```
