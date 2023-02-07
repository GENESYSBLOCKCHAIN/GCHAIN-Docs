# Use MetaMask For Genesys Chain


!!! Tip
    You may encounter a network configuration issue in recent releases of MetaMask, Please go to "Upgrade" section for solution


## What is it?

MetaMask was created out of the needs of creating more secure and usable Ethereum-based web sites. In particular, it handles account management and connecting the user to the blockchain.
It’s supported in Chrome, Brave, and Safari browsers.
## Install

**Example: Install MetaMask in Brave browser**

* Open Extension Category in Brave: https://chrome.google.com/webstore/category/extensionsSearch for MetaMask

![img](/assets/metamask/1.png)

!!! warning
    Note: Make sure it’s offered by metamask.io

* Click on “Add to Brave”

That’s it! You have successfully installed MetaMask extension in Brave!
<img src="/assets/metamask/2.png" alt="img" style="zoom:33%;" />

!!! Tip
    The workflow is the same for all browsers

## Create an account in MetaMask for Genesys Chain

1. Click on the “Create a wallet” button

<img src="/assets/metamask/3.png" alt="img" style="zoom:33%;" />
2. Create Password of at least 8 characters</br>
<img src="/assets/metamask/4.png" alt="img" style="zoom:33%;" />

3. Click on “Create” and then write down your backup phrase.

<img src="/assets/metamask/5.png" alt="img" style="zoom:33%;" />

4. Select each phrase in order to make sure it is correct then click “Confirm”.

<img src="/assets/metamask/6.png" alt="img" style="zoom:33%;" />

Congratulations! you have create your MetaMask account!

## Connect Your MetaMask With Genesys Chain

1. Go to setting page</br>

<img src="/assets/metamask/7.png" alt="img" style="zoom:33%;" />

2. Add a new network</br><img src="/assets/metamask/8.png" alt="img" style="zoom:50%;" /></br>

      * Testnet
        * [RPC URLs](../developer/rpc.md)
        * ChainID: 11512 
        * Symbol: GSYS
        * Block Explorer: https://testnet-explorer.genesys.network

      * Mainnet
        * [RPC URLs](../developer/rpc.md)
        * ChainID: 11513 
        * Symbol: GSYS
        * Block Explorer: https://genesys.network

3. Claim some testnet token to your account
Click on your address for copy
<img src="/assets/metamask/9.png" alt="img" style="zoom:33%;" />

4. Go to faucet page: https://testnet-explorer.genesys.network/faucet-smart, then paste your address in the box and click on “Give me GSYS”

!!! Tip
    Please note that you can only claim once every minute
![img](/assets/metamask/10.png)</br>
After the transfer transaction is sent, you will see an increase of your balance<img src="/assets/metamask/11.png" alt="img" style="zoom:33%;" />

## Transfer GSYS to other Genesys Chain address

1. Log in to your MetaMask</br>
<img src="/assets/metamask/12.png" alt="img" style="zoom: 33%;" />

2. Click on Send button</br><img src="/assets/metamask/13.png" alt="img" style="zoom:33%;" />

3. Copy the receiver’s address in the box</br>
<img src="/assets/metamask/14.png" alt="img" style="zoom:33%;" />

4. Input the amount</br><img src="/assets/metamask/15.png" alt="img" style="zoom:33%;" />
5. Go to Advanced Options to modify default gas price when necessary </br>
<img src="/assets/metamask/16.png" alt="img" style="zoom:33%;" />

6. Confirm your transaction, then click Next</br><img src="/assets/metamask/17.png" alt="img" style="zoom:33%;" />

7. Click Confirm to send your transaction</br>
<img src="/assets/metamask/18.png" alt="img" style="zoom:33%;" />
8. Wait for your transaction to be included in the new block</br>
<img src="/assets/metamask/19.png" alt="img" style="zoom:33%;" />
9. Once your transaction is confirmed, check it on block explorer by clicking Details </br>
  <img src="/assets/metamask/20.png" alt="img" style="zoom:33%;" />
  10. Click on your account to see "Details''</br>
  <img src="/assets/metamask/21.png" alt="img" style="zoom:33%;" />		      					<img src="/assets/metamask/22.png" alt="img" style="zoom:33%;" />

Verify your transaction in Explorer:
![img](/assets/metamask/23.png)

## Add BLUE20 Tokens
1. Deploy an ERC20 contract at https://remix.ethereum.org/
You can create a new file or import a sample contract: <https://gist.github.com/HaoyangLiu/3c4dc081b7b5250877e40b82667c8508></br>
<img src="/assets/metamask/24.png" alt="img" style="zoom:33%;" /></br><img src="/assets/metamask/25.png" alt="img" style="zoom:50%;" />

2. Connect your Genesys Chain Account to Remix</br>
<img src="/assets/metamask/26.png" alt="img" style="zoom:33%;" />
3. Select “ABCToken” contract and compile
![img](/assets/metamask/27.png)
4. Deploy your compiled contract
![img](/assets/metamask/28.png)
5. Adjust Gas Fee for your contract, then confirm your deploy contract</br>
<img src="/assets/metamask/29.png" alt="img" style="zoom:33%;" /></br>
You can see that there is a new ceate contract transaction in block explorer
![img](/assets/metamask/30.png)

6. In MetaMask, Click on “Add Token”</br>
<img src="/assets/metamask/31.png" alt="img" style="zoom:33%;" />

7. Choose “Custom Token” and copy the contract address in the box</br>
<img src="/assets/metamask/32.png" alt="img" style="zoom:33%;" />

8. Click on “Add Tokens”</br>
<img src="/assets/metamask/33.png" alt="img" style="zoom:33%;" /></br>
Then you can see change of your balance</br>
<img src="/assets/metamask/34.png" alt="img" style="zoom:33%;" />                                <img src="/assets/metamask/35.png" alt="img" style="zoom:33%;" />

## Create Multiple Accounts

1. To create multiple accounts, you click on Profile icon on MetaMask and then click on Create Account</br>
<img src="/assets/metamask/36.png" alt="img" style="zoom:33%;" />

2. You can then add an account name and click on Create.</br>
<img src="/assets/metamask/37.png" alt="img" style="zoom:33%;" />

3. Then you can see a new account is created!</br>
<img src="/assets/metamask/38.png" alt="img" style="zoom:33%;" />

## Upgrade

Since the release of v8.1.3, MetaMask sometimes displays the warning message "Invalid Custom Network".  

<img src="/assets/metamask/39.png" alt="img" style="zoom:33%;" />

To solve this issue, click on "'Settings" and enter Chain ID of Genesys Chain network again. If **56** doesn’t work, try **0x38**. 

<img src="/assets/metamask/40.png" alt="img"  />

<img src="/assets/metamask/41.png" alt="img"  />
