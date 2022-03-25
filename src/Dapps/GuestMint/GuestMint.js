"use strict";

const nearAPI = require("near-api-js");
const { connect, keyStores, WalletConnection } = nearAPI;

const accountName = "burner1.drshade.testnet"

const config = {
    networkId: "testnet",
    keyStore: new keyStores.BrowserLocalStorageKeyStore(),
    nodeUrl: "https://rpc.testnet.near.org",
    walletUrl: "https://wallet.testnet.near.org",
    helperUrl: "https://helper.testnet.near.org",
    explorerUrl: "https://explorer.testnet.near.org",
};

const connectNear = connect(config)
const connectWallet = connectNear.then((near) => new WalletConnection(near))

const contract = 
    connectWallet
        .then((wallet) =>
            new nearAPI.Contract(
                wallet.account(),
                accountName,
                {
                    viewMethods: ["get_messages"],
                    changeMethods: ["add_message"],
                    sender: wallet.account(),
                }
            )
        )

exports._walletConnected = left => right => (_, resolve) => {
    try {
        connectWallet
            .then((wallet) => {
                resolve(right(wallet.isSignedIn()))
            })
    }
    catch (e) {
        console.log(e.message);
        resolve(left(e.message));
    }
    return (cancelError, onCancelerError, onCancelerSuccess) => onCancelerSuccess();
}

exports._signInWallet = left => right => (_, resolve) => {
    try {
        connectWallet
            .then((wallet) => 
                wallet.requestSignIn({
                    contractId: accountName,
                    methodNames: ["add_message"],
                })
            )
            .then((result) => 
                resolve(right(result))
            )
    }
    catch (e) {
        console.log(e.message);
        resolve(left(e.message));
    }
    return (cancelError, onCancelerError, onCancelerSuccess) => onCancelerSuccess();
}

exports._signOutWallet = left => right => (_, resolve) => {
    try {
        connectWallet
            .then((wallet) => 
                wallet.signOut()
            )
            .then((result) => 
                resolve(right(result))
            )
    }
    catch (e) {
        console.log(e.message);
        resolve(left(e.message));
    }
    return (cancelError, onCancelerError, onCancelerSuccess) => onCancelerSuccess();
}

exports._accountId = left => right => (_, resolve) => {
    try {
        connectWallet
            .then((wallet) => 
                wallet.getAccountId()
            )
            .then((result) => 
                resolve(right(result))
            )
    }
    catch (e) {
        console.log(e.message);
        resolve(left(e.message));
    }
    return (cancelError, onCancelerError, onCancelerSuccess) => onCancelerSuccess();
}

exports._messages = left => right => (_, resolve) => {
    try {
        contract
            .then((contract) => contract.get_messages())
            .then((value) => {
                console.log(value)
                resolve(right(value))
            })
    }
    catch (e) {
        console.log(e.message);
        resolve(left(e.message));
    }

    return (cancelError, onCancelerError, onCancelerSuccess) => onCancelerSuccess();
}

exports._addMessage = message => left => right => (_, resolve) => {
    try {
        console.log("add message called")
        contract
            .then((contract) => contract.add_message({ message: message }))
            .then((value) => resolve(right(value)))
    }
    catch (e) {
        console.log(e.message);
        resolve(left(e.message));
    }

    return (cancelError, onCancelerError, onCancelerSuccess) => onCancelerSuccess();
}

