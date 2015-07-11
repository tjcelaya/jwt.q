\d .qjwt

qrand:`qcrypt 2: (`qrand;1)
hash:`qcrypt 2: (`hash;2)
pbkdf2:`qcrypt 2: (`pbkdf2;4)

b64:{ / x:`d or `e; y: charlist to {de,en}code
  if[not x in `d`e;'`$"x must be `d or `e"];
  if[not 10h=type y;'`$"y must be a charlist"];
  .q.raze system "echo '",y,"'|base64",$[x=`d;" -d";""]}

b64e:{b64[`e;x]}
b64d:{b64[`d;x]}

encode:{}

decode:{}

hmac:{

  }

test:{
  / "{\"alg\":\"HS256\",\"typ\":\"JWT\"}"
  header:.j.j `alg`typ!(enlist"HS256"),enlist"JWT";
  / "{\"sub\":\"1234567890\",\"name\":\"John Doe\",\"admin\":true}"
  payload:.j.j `sub`name`admin!(enlist"1234567890"),(enlist"John Doe"),enlist 1b;

  :hash[b64[`e;header],".",b64[`e;payload];"sha256"];
  }
