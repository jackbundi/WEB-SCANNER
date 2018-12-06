

## Test on Secure Headers

### HTTP Strict Transport Security (HSTS) 

Let’s say you have a website named example.com and you installed an SSL/TLS certificate and migrated from HTTP to HTTPS. This is good, right? That was rhetorical. It definitely is. But this isn’t where the work stops. What if your website is still available over HTTP? It would be utterly pointless, right? Many website admins migrate to HTTPS and then forget about it without realizing this. This is where HSTS enters the picture.

If a site is equipped with HTTPS, the server forces the browser to communicate over secure HTTPS. This way, the possibility of an HTTP connection is eliminated entirely. 

### Content Security Policy (CSP)

The HTTP Content Security Policy response header gives website admins a sense of control by giving them the authority to restrict the resources a user is allowed to load within site. In other words, you can whitelist your site’s content sources. Content Security Policy protects against Cross Site Scripting and other code injection attacks. Although it doesn’t eliminate their possibility entirely, it can sure minimize the damage. Compatibility isn’t a problem as most of the major browsers support CSP.

### Cross Site Scripting Protection (X-XSS) 

As the name suggests, X-XSS header protects against Cross-Site Scripting attacks. XSS Filter is enabled in Chrome, IE, and Safari by default. This filter doesn’t let the page load when it detects a cross-site scripting attack.


### X-Frame-Options 

In the Orkut era, a spoofing technique called ‘Clickjacking’ was pretty popular. It still is. In this technique, an attacker fools a user into clicking something that isn’t there. For example, a user might think that he’s on the official Orkut website, but something else is running in the background. A user may reveal his/her confidential information in the process. X-Frame-Options help guard against these kinds of attacks. This is done by disabling the iframes present on the site. In other words, it doesn’t let others embed your content.

### X-Content-Type-Options 

The X-Content-Type header offers a countermeasure against MIME sniffing. It instructs the browser to follow the MIME types indicated in the header. Used as a feature to discover an asset’s file format, MIME sniffing can also be used to execute cross-site scripting attacks.

