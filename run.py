import requests

RANGE_FROM = 1
RANGE_TO = 6

services = ['backend_1a', 'backend_2a', 'backend_3a']
serviceDomains = []

for service in services:
    endpoint = "http://{}:8080".format(service)
    serviceDomains.append(endpoint)

for x in range(RANGE_FROM, RANGE_TO):
    for service in serviceDomains:
        url = "{}/{}".format(service,x)
        print(url)
        response = requests.get(url)
