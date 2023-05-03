# Bruteforce

Repository with different scripts to perform brute force attacks.

Educational purposes only.

## xmlrpc

Script to abuse an exposed xmlrpc file to brute force against a known user. **The <ins>rockyou</ins> dictionary is used in the script.** By default, the dictionary is in the /usr/share/wordlists/ directory.

**IMPORTANT: You have to change the URL in the script itself. For testing purposes, the attack is currently done against localhost on the port 31337.** 

See [Damn Vulnerable Wordpress](https://github.com/vavkamil/dvwp)

```bash
./xmlrpc_bruteforce.sh -u <username>
```
