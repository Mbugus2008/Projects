from base64 import b64encode
import requests
from Crypto.Hash import SHA256
from Crypto.Signature import PKCS1_v1_5
from Crypto.PublicKey import RSA
import json

message = "1160161767721KE2019-09-19".encode('utf-8') # See separate instruction on how to create this concatenation
digest = SHA256.new()
digest.update(message)

private_key = False
with open("D:\Projects\privatekey.pem", "r") as myfile:
    private_key = RSA.importKey(myfile.read())

signer = PKCS1_v1_5.new(private_key)
sigBytes = signer.sign(digest)
signBase64 = b64encode(sigBytes)
print(signBase64)
headers = {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer cz7S1uqZItHFJQKxbfQt15GX56wb',
    'signature': signBase64
}
params = {}

payload = {
    "countryCode": "KE",
    "accountId": "1160161767721",
    "date": "2018-08-09"
}
print(payload["accountId"])
url = 'https://uat.jengahq.io/account/v2/accounts/balances/KE/1160161767721'
response = requests.get(url, headers=headers, params=params,data=json.dumps(payload))

print(response.text)