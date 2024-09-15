import requests

RANGE_FROM = 1
RANGE_TO = 11

for x in range(RANGE_FROM, RANGE_TO):
    url = "http://nginx/{}".format(x)
    response = requests.get(url)
    data = response.json()
    instance = data["instanceId"]
    print("Server: {}".format(instance))
