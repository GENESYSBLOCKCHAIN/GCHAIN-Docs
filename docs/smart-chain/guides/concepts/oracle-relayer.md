# Oracle Relayer


The relayer is a service which monitors events on TC, builds and broadcasts transactions to BC. Each validator operator should maintain its own relayer service. The relayer service requires to have access to validator operator private key. All relayer service independently witness the peggy contract events, then build transactions to claim events to BC oracle module.

The relay process:

* Continually listen for cross chain event
* Parse the cross chain tranfer parameters from event data
* Use this information to build an unsigned BC oracle transaction
* Sign and broadcast transaction.


GitHub Implementation link: <https://github.com/githubusername/githubrepo/oracle-relayer>
