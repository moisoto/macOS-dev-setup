# GPG Expert Configuration

This document describes how to setup a proper GPG Master-Key + Sub-Keys scheme for use with several machines.

I've provided the [new-gpg-key.sh](https://github.com/moisoto/macOS-dev-setup/blob/main/new-gpg-key.sh) script for a mostly automated way of creating the keys described here.
However it is important that you read the explanation below in order to understand how the key structure is organized.

## Creating a Master Key

First create a key that will be used only for certification.

Use the following command and follow the instructions provided below:

```shell
gpg --expert --full-generate-key
```

You will be shown several options for the kind of key you want to create.

We want to select `ECC (set your own capabilities)` (currently the option #11).
You will see something like this after selecting it:

```
Your selection? 11

Possible actions for this ECC key: Sign Certify Authenticate
Current allowed actions: Sign Certify

   (S) Toggle the sign capability
   (A) Toggle the authenticate capability
   (Q) Finished

Your selection?
```

The current options listed here are `Sign Certify`. You should select `S` to disable sign capability.
This will produce something like this:

```
Your selection? S

Possible actions for this ECC key: Sign Certify Authenticate
Current allowed actions: Certify

   (S) Toggle the sign capability
   (A) Toggle the authenticate capability
   (Q) Finished

Your selection?
```

Now select `Q` to continue.
For the rest of the prompts you can select:

* Elliptic curve: `Curve 25519`
* Expiration date: `No expiration date`
* For the passphrase, choose one with at least 16 ramdom characters.

## Adding sub-keys

You will now add specific subkeys for each task. But first you need to know your masterkey fingerprint.

To get it execute the following command:

```shell
gpg --list-secret-keys --keyid-format LONG
```

The fingerprint will be shown in the second line of your masterkey entry.

Now let's create the subkeys:

```shell
KEY="PUT-MASTERKEY-FINGERPRINT-HERE"

# Signing subkey (no expiration)
gpg --quick-add-key $KEY ed25519 sign never

# Encryption subkey (no expiration)
gpg --quick-add-key $KEY cv25519 encr never

# Authentication subkey (optional, no expiration)
gpg --quick-add-key $KEY ed25519 auth never
```

## About key expiration

While in the previous examples I choose not to set expiration dates for my keys,
sometimes it is recommended to set an expiration date, specially on the sub-keys.

For example you may want to create your encryption keys with an expiration date:

```shell
KEY="PUT-MASTERKEY-FINGERPRINT-HERE"

# Encryption subkey (expires in one year)
gpg --quick-add-key $KEY cv25519 encr 1y
```

## Understarding the Key Hierarchy

After you generate your key and add the subkeys you can list it by executing this command:

```shell
gpg --list-secret-keys --keyid-format LONG
```

You will see something similar to:

```
sec   ed25519/0ACC81D8F780E140 2026-06-06 [C]
      70D14E2AE58DAAD50A537B2E0ACC81D8F780E140
uid                 [ultimate] Test User (For GitHub Commits) <12345678+test@users.noreply.github.com>
ssb   ed25519/291961C830DA8B43 2026-06-06 [S]
      F2CB5E15CFD208FD6B5AB284291961C830DA8B43
ssb   cv25519/76B485C52F12E815 2026-06-06 [E]
      6FE9781DCABC895EA2B068F476B485C52F12E815
ssb   ed25519/A3128191FF985114 2026-06-06 [A]
      341E46920CE193E6FA612C4EA3128191FF985114
```

The output above shows the MasterKey IDs and the subkey IDs as follows:

* The record `sec` is the secret key. You should only use this key to manage other keys, and to certify other people's keys. Keep it only on one machine if possible (check below for an explanation of how to export only the subkeys).
* After `sec`, you can see the algorith for the key is `ed25519`, and following the algorith name is the `key id`.
* Below the `sec` record you can see the corresponding secret key fingerprint. Notice is a longer version of the `key id`
* The `uid` record is the User ID associated with the key. For example when you upload a signing public key to github, it checks if the uid's mail corresponds to the account you are trying to commit from.
* Below the `uid` there are three `ssb` records. Those are subkeys. Each subkeys has an associated capability that you specified when creating them.
* The capability can be identified at the end of the record, between square brackets:
  * [S]: Sign Capability
  * [E]: Encrypt Capability
  * [A]: Authentication Capability

## Setting up Additional User ID(s)

In case you need to add another user ID to your gpg key, you can use the following command:

```shell
KEY="PUT-MASTERKEY-HERE"
gpg --edit-key $KEY
```

This will enter gpg interactive mode, then you can add an user id by typing `adduid` at the prompt:

```
gpg> adduid
```

Enter the requested user information and the updated key information will be shown including the new UID.
Take note of the number asigned to your new user and replace N with it in the followig commands:

```
gpg> uid N
gpg> trust
gpg> save
```

Please note that you will need to provide the passphrase in order to apply the changes.

## Exporting your public keys.

You can now export public keys for any of the sub-keys.

For example you can export the public key for the Sign Subkey and upload it to your github account:

```shell
SUBKEY="PUT-SUBKEY_ID-HERE"
gpg --armor --export ${SUBKEY}! > public-sign-subkey-$SUBKEY.asc
```

Please notice at the end of the sub-key id there's a ! sign.
This ensures only the sign public key will be exported.
When you upload this to github you should only see the master-key id, and the sign sub-key id.

## Exporting your private keys.

If you work on several machines, it is recommended you keep your **Master Secret** Key in only one of them
(you can also store it in secure location in a secure drive).

For the other machine(s) you should export only the specific secret sub-keys:

```shell
SUBKEY="PUT-SUBKEY_ID-HERE"
gpg --armor --export-secret-subkeys ${SUBKEY}! > secret-subkey-$SUBKEY.asc
```

Then import the secret subkey on the other machine(s):

```shell
SUBKEY="PUT-SUBKEY_ID-HERE"
gpg --import secret-subkey-$SUBKEY.asc
```
