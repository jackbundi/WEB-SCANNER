import requests
import sys

url = sys.argv[1]

def hsts_tester(url):
    print '[+] checking whether %s supports HSTS...' % (url)
    try:
        req = requests.get(url)
    except requests.exceptions.SSLError as error:
        print "[!] Site doesn't have SSL working properly (%s)" % (error, )
        return False
    if 'strict-transport-security' in req.headers:
        print "[+] Site has Strict Transport Security Enabled"
    else:
        print "[!] Site doesn't have Strict Transport Security Enabled"


hsts_tester(url)