VERBOSE:.z.x[0]~"-vt"

t:{[name;res;expect]
    res:raze res;
    $[VERBOSE;show (`teststart;name;res;expect);]
    bool:res~expect;
    -1 $[not bool;[2 res;2 "testfailed:",string name;exit 1];(string name),": success"]}

libmissing:{-2 "couldn't find qcrypt";exit 1}
.[(2:);(`:/qcrypt;(`hmac;3));libmissing]

hmac:`:/qcrypt 2: (`hmac;3)
hash:`:/qcrypt 2: (`hash;2)
b64e:`:/qcrypt 2: (`b64e;1)
b64d:`:/qcrypt 2: (`b64d;1)

t[`$"it can hmacsha256";
  hmac["secret";"message";"sha256"];
  0x8b5f48702995c1598c573db1e21866a9b825d4a794d169d7060a03605796360b];
t[`$"it can sha256";
  hash["secret data";"sha256"];
  0xd736e5854ab7491d5ccd80db8c68697ac0beca5889e7600cdcd37b739b870ddc];
t[`$"it can sha1";
  hash["insecure?";"sha1"];
  0x5cfcdb6502d4506cefdf0ad773676cd895838ff8];
t[`$"it can b64 encode";
  b64e["words!"];
  "d29yZHMh"];
t[`$"it can b64 decode";
  b64d["d29yZHMh"];
  "words!"];
t[`$"it can b64 encode and decode transparently";
  b64d b64e "words!";
  "words!"];

exit 0
