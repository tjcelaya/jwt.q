\d .crypto

qrand:`:/qcrypt 2: (`qrand;1)
hash:`:/qcrypt 2: (`hash;2)
hmac:`:/qcrypt 2: (`hmac;3)
pbkdf2:`:/qcrypt 2: (`pbkdf2;4)
b64e:`:/qcrypt 2: (`b64e;1)
b64d:`:/qcrypt 2: (`b64d;1)

\d .jwt

hashFns:`HS256`HS384`HS512!("sha256";"sha384";"sha512")
header:{.crypto.b64e .j.j `alg`typ!(x;"JWT")}

generate:{[secret;payload;hFn]
  if[not hFn in key hashFns;'`$"hash function not supported"];
  encodedHeader:header[hFn];
  encodedPayload:.crypto.b64e .j.j payload;
  signature:.crypto.b64e`char$.crypto.hmac[
    secret;
    encodedHeader,".",encodedPayload;
    hashFns[hFn]];
  :encodedHeader,".",encodedPayload,".",signature}

verify:{[secret;encoded;hFn]
  if[not hFn in key hashFns;'`$"hash function not supported"];
  parts:"."vs encoded;
  :parts[2]~.crypto.b64e`char$hmac[secret;parts[0],".",parts[1];hashFns[hFn]]}

payload:{.j.k .crypto.b64d ("."vs x)[1]}

