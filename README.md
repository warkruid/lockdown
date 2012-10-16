# Lockdown
 
##Summary
A simple iptables firewall script to use when you are banking online. 
This script limits traffic from and to your computer to a set of domains/ip 
adresses defined by you. This script blocks any and all scripts  
(javascript/java whatever) or webbugs which try to call a site outside of the ones you defined. 

##Usage
lockdown <primary site> <secondary site> <tertiary site>

The primary site is the one with the loginpage. After login you may be redirected to 
other sites. (This may take some experimentation)

It is probably easiest to make an alias in your .bashrc

Something on the lines of: alias <bankname>="<loginsite> <sitename1> <sitename2>" 

After that, you just type "bankname" and your brower should start up with
the correct site and you can only navigate within the site(s) you specfied. 
But more importantly.. Your browser cannot cannot contact other sites,
or be (invisibly) redirected to other sites. 
(Think webbugs, trackerscripts or more malicious software such as trojans)

##Examples

In my case I've added the following to my .bashrc:

alias ing="mijn.ing.nl bankieren.mijn.ing.nl www.ing.nl"

Now I only have to type "ing" in a terminal box.

Drop me a note about which combination of domains work in your case and
I will include them in these examples.


##History
The first reason to write lockdown was to block possible banking trojans. 
While there are (at the time of writing) no banking trojans for Linux that I know of,
it is only a matter of time before one emerges.
In all the papers I read about windows banking trojans, they have one thing in common.
During the banking session the trojan communicates with a Command & Control server
on the internet. 

Lockdown blocks this communication.

The second reason for writing lockdown was that I had already noticed that my banking site 
uses third party tracking software. 
This was already blocked by the firefox plugin Ghostery. Ghostery however, only
blocks webbugs that it knows about. So what else was transmitted to third party sites?

Lockdown blocks any and all communication other than with the banking site(s).

##Caveat
Lockdown, by itself, is not enough to keep your banking sessions safe!

##Recommendations:
* Keep your browser up to date.
* Keep your linux distribution up to date.
* If anything looks different from previous logins, **STOP IMMEDIATELY** and contact your bank.

Better yet, use this script in combination with a distribution like [TinyCore][2] and install it
on a usb stick, and use this stick to boot your computer _only for banking purposes_.

You could remaster the TinyCore iso to add lockdown and the aliases
to the iso, burn it to a CD and boot from this. 
For banking and live CD's See the article by [Bill Mullins][1]

The downside to this is that the plugin Certificate Patrol (see below) won't be able to store new certificates 
and you won't be able to extend the aliases/domains to the lockdown script.

Alternatives to [TinyCore][2] are:

* [Puppy Linux][5] Again see an article by [Bill Mullins][4] 
* [Knoppix][6] The granddaddy of all live CD's

##Suggestions for firefox:
* Make a separate banking profile for firefox. ("firefox --profilemanager"
* In the lockdown script change BROWSER="firefox" to BROWSER="firefox -P <profilename>"
* Disable unneeded plugins and extensions (java,flash) in this profile
* Install a plugin like [Certificate Patrol][3] in this profile. 

When using the above mentioned suggestions for firefox, [Certificate Patrol][3] will generate some
messages about the certificates when visiting your banking site.
When visting this site at a later time, and [Certificate Patrol][3] generates a warning about changed
certificates, **READ THIS WARNING VERY CAREFULLY** and decide what to do. When in doubt, contact your
bank.

##Links
[1]: https://billmullins.wordpress.com/2011/07/28/secure-your-online-banking-with-a-linux-live-cd/ "Secure your online banking with a linux live cd"
[2]: http://distro.ibiblio.org/tinycorelinux "Tiny Core Linux"
[3]: https://addons.mozilla.org/en-us/firefox/addon/certificate-patrol/
[4]: https://billmullins.wordpress.com/2012/07/09/bite-back-against-banking-bandits-with-puppy-linux/
[5]: http://puppylinux.org
[6]: http://www.knoppix.com
