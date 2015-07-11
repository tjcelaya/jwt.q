#include <stdio.h>
#include <string.h>
#include <openssl/hmac.h>

int main()
{
    // The key to hash
    char key[] = "secret";

    // The data that we're going to hash using HMAC
    char data[] = "message";
    
    unsigned char* digest;
    
    // Using sha1 hash engine here.
    // You may use other hash engines. e.g EVP_md5(), EVP_sha224, EVP_sha512, etc
    digest = HMAC(EVP_sha256(), key, strlen(key), (unsigned char*)data, strlen(data), NULL, NULL);    

    // Be careful of the length of string with the choosen hash engine. SHA1 produces a 20-byte hash value which rendered as 40 characters.
    // Change the length accordingly with your choosen hash engine
    unsigned int bytelength = strlen(digest);
    char* mdString = calloc(bytelength,sizeof (char));
    int i;
    for(i = 0; i < bytelength; i++)
         sprintf(&mdString[i*2], "%02x", (unsigned int)digest[i]);

    printf("HMAC digest: %s\n", mdString);

    return 0;
}
