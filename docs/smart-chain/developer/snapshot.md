# Snapshot

For v1.1.0:

* [Latest Snapshot](https://github.com/githubusername/githubrepo)

The following commands are step by step instructions for GSYS node operators that can be used for two major use-cases:

1. Fixing nodes that are stuck or crashed;
2. Jumpstarting a newly setup validator node; avoid waiting some hours for synchronization

Basically, a compressed version of the last-known "good" chaindata is downloaded. Remove the node's old data and update it with the newly downloaded data. Finally, restart the sync-process from this known-good checkpoint.


Note: Ensure there is enough disk space for both the zip file AND its uncompressed contents. Double the space or more.

Download March Snapshot from CLI using wget

```
wget --no-check-certificate --no-proxy 'https://github.com/githubusername/githubrepo'
```

> Tip: extract the data in background

In case you can not wait for the extraction to finish, you can run it in the background

```
# Extract the data
nohup unzip  /NAME_OF_YOUR_HOME/node/geth/ -f chaindata_202102.zip &
# Start your node back
geth --config ./config.toml --datadir ./node --syncmode snap
```
