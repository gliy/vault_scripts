Scripts for Vault API
============
== How to Use ==
* Copy or download the shell_scripts folder to your local machine.
* edit info.txt, and replace the example fields with your URL, username and password
* run login.sh (./login.sh or sh login.sh) (the auth.out file will contain your session id)
* run allfunc.sh and selected the URL you want to execute
* fill in the prompted parameters (version is v7.0)

== Issues ==
* Cannot handle unknown parameters (ex. the q parameter in /query)

== Required Software (All lab machines have the required software) ==
* Bash shell
* Curl library
* Python with json.tool
