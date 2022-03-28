import requests
from getpass import getpass
from requests.auth import HTTPBasicAuth
import json
from pprint import pprint

USER = input("Please enter your username for DNAC: ")
PASS = getpass("Please enter your password for DNAC: ")

BASEURL = 'https://sandboxdnac.cisco.com'
authAPI = "/dna/system/api/v1/auth/token"
deviceListAPI = "/dna/intent/api/v1/network-device"

payload={}
headers = {
  'Accept': 'application/json',
  'Content-Type': 'application/json'
}

dnaAUTH = BASEURL + authAPI

response = requests.post(dnaAUTH, auth=HTTPBasicAuth(USER, PASS), headers=headers, data=payload)

tokenJSON = response.json()
TOKEN = tokenJSON['Token']

dnaDeviceList = BASEURL + deviceListAPI

payload={}
headers = {
  'X-Auth-Token': TOKEN,
  'Content-Type': 'application/json',
  'Accept': 'application/json'
}

getResponse = requests.get(dnaDeviceList, headers=headers, data=payload)
getJSON = getResponse.json()

pprint(getJSON)
