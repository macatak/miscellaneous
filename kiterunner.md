Bruteforcer

https://github.com/assetnote/kiterunner

allows use of Swagger JSON files, Assetnote’s .kites files, and .txt wordlists.
API specific scanner


Helpful wordlists
https://github.com/hAPI-hacker/Hacking-APIs/blob/main/docs_subdomain
https://github.com/hAPI-hacker/Hacking-APIs/blob/main/Wordlists/api_superlist
```shell
curl https://wordlists-cdn.assetnote.io/data/automated/httparchive_apiroutes_2021_06_28.txt > apiAssetNote-2021.txt
```


# install

```shell
git clone https://github.com/assetnote/kiterunner.git
cd kiterunner
make build
sudo ln -s $(pwd)/dist/kr /usr/local/bin/kr


```
1

Single target
```bash
kr scan http://127.0.0.1:8090 -w routes-small.kite 
```
output
```text
 100%  (9691/9691, 433 it/s)   
1:04PM INF no results found                         
Continue Scanning with full wordlist? [y/n]: y
GET     200 [    528,   56,  12] http://127.0.0.1:8888/.well-known/jwks.json 0cc39f7830e5fcccc1ed2557f9a475dcd626f718
 100% (53033/53033, 416 it/s)             
1:06PM INF scan complete duration=174175.845793 results=1
```

Add a token
  - -H adds authorization header
```bash
kr scan http://127.0.0.1:8090 -w routes-large.kite -H 'Set-Cookie: session=C5JNPOT5SPm1Pb5FK7i29g.CliZldCFz9pA3GaELHvxMlr5cBZGxY8N5yHZL-QOKL0KN5Qy15NI71NGrJesToIRLjQ1KwCWs1kB_WxL63JyLykFJJH6edaOrzGSOG97eCG4PsSF-bUSGdEyqR3Xz-S7q5o7M8-Apq1xSeVHEVHcj5YIvlDABwAMTLCjy2qxFi9vNtUVXbW_MUwppJ5e8o5ytaQJKZUxY7M__qbIiJ5S1fISpCrSTe4PlPP8PZaJbqGz3ybux3lWL-71CySebz7YmYQJKWFvOwivl04YsgyDgKoXJ3O-xj2na4-dhUx9ssE122IFrS9lTT5Z4Q9h2U1ljEgR93DezlSgwGpaAL84KQ.1693851108660.86400000.7t5NqoXH3IyQawZLEgUsRil3MvXym3C2GwgmD7hkx-A'
```

single target, but with http and https
```bash
kr scan target.com -w routes.kite -A=apiroutes-210228:20000 -x 10 --ignore-length=34
```

list of targets
```bash
kr scan targets.txt -w routes.kite -A=apiroutes-210228:20000 -x 10 --ignore-length=34
```

Brute force w/ a wordlist
```bash
kr brute 127.0.0.1:8888 -w /home/bikeride/tools/kiterunner/wordlists/swagger-wordlist.txt 

```

# send to an intercept proxy
```shell
kr kb replay -w /home/bikeride/tools/kiterunner/routes-large.kite --proxy=http://127.0.0.1:8080 'GET 403 [ 48, 3, 1] http://127.0.0.1:8090/api/picture/detail.php 0cf6889d2fba4be08930547f145649ffead29edb'
```
