# Cloudflare DNS Management using API

With this script, you can create or edit DNS records of your domain in cloudflare. The script has been written in bash and it should work with most modern Linux distributions (including server and desktop).

### Features:

- Fully automated(no need to enter anything manually in the command line).
- Compatible with most Linux and UNIX operating systems since it uses GNU tools.

### prerequisites:
In case you are using Debian, you might need to install the following packages:
- curl
- jq

```
apt update & apt install curl jq -y
```

### Getting Started:
To start using the script, you should enter your DNS records in `records.txt` based on the given examples. Please keep in mind that you should separate the record data using only one space “ “. Otherwise, you may encounter some errors in run time.

```
chmod a+x cloudflare.sh
./cloudflare.sh
```

### Thing to keep in mind:
This script only supports the following DNS records at this time and I will update it when needed:
- A record
- CNAME or alias record
- MX record
- TXT record
