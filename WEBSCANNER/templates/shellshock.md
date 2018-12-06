

## Shellshock

Shellshock is a security bug causing Bash to execute commands from environment variables unintentionally. In other words if exploited the vulnerability allows the attacker to remotely issue commands on the server, also known as remote code execution. Even though Bash is not an internet-facing service, many internet and network services such as web servers use environment variables to communicate with the server's operating system.

Since the environment variables are not sanitized properly by Bash before being executed, the attacker can send commands to the server through HTTP requests and get them executed by the web server operating system. The shellshock vulnerability, discovered by Stephane Chazelas was assigned the CVE identifier CVE-2014-6271. A similar bug with identical consequences was discovered by Tavis Ormandy and was assigned the CVE identifier CVE-2014-7169.

