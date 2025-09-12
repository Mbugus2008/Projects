import requests
import json
from collections import namedtuple
url = "https://uat.jengahq.io/identity/v2/token"
payload = "username=6661537935&password=Fnm8WmexXJ1xisWn5DaDGFuLLE6IfDXJ"


headers = {
    
    'Content-Type': "application/x-www-form-urlencoded",
    'Authorization': "Basic VTVBWmJ0czVxdFZKUHp0WEZHNDNhWll5dzFiaUtoY006WEdqakxBY21jcmtGSVlzcw==",
   
    }

response = requests.request("POST", url, data=payload, headers=headers,verify=True)
x = json.loads(response.content, object_hook=lambda d: namedtuple('X', d.keys())(*d.values()))


print(response.text)
