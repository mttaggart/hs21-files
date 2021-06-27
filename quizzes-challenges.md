# Quizzes/Challenges

## Session 0

**User:** `start0:HS21{lets_begin}`

### Linux Basics

**User:** `start1`

1. Who was the creator of Linux?
2. Where was the UNIX Operating System created?
3. Ubuntu, Fedora, SUSE, and Debian are examples of Linux \_\_\_\_\_\_.
4. Why are we allowed to use Linux without paying for it? 

## Session 1: The Command Line:

### Navigating the filesystem

**User:** `cmd01`

1. Enter the current working directory
2. Current user name
3. List all the files in the current directory. How many start with the letter x?
    * How do we look at hidden files?
4. Enter the contents of `message.txt`
    * What command can we use to print contents of files? 

### Files and Permissions

**User:** `cmd02`

1. What is the current user id?
2. What command is this user able to run with `sudo`?
3. What is the bit mode for User: rwx, group: rx, and Other: x?
4. Who is the owner of the hidden file in this user's home folder? 

### Piping and Output Redirection

**User:** `cmd03`

1. Pipe the output of `runme` to a file called `runme.txt`. What is the size in bytes of `runme.txt`?
2. Append the text `HACKSUMMER21` to the end of `runme.txt`. What is the MD5 hash of the file?
3. Inside of `runme.txt` is a flag. Find it using `grep` and enter it here.
4. Somewhere on the system is a file called `cmd03flag.txt`. Find it and enter the flag.

## Session 2: Vim

**User:** `vim01`

1. How do you enter insert mode? 
2. How would we find and replace every exclamation point with a question mark in the current buffer?
3. How would we ask for help on what the `x` key does?
4. How do we save and quit with a single command?

## Sesssion 3: Networking

### IP Basics

**User:** `net01`

1. What is this machine's IP address?
2. How many network interfaces are configured?
3. What is the default gateway? 
4. Enter the command to ping `google.com` 5 times.

### Clients and Servers

**User:** `net02`

1. What is the default HTTP port? **80**
2. Use netcat to connect to <<URL>>. What is the flag?

### CHALLENGE: Web Server

**User:** `netchallenge`

Install `nginx`. Modify the server root to point to the `website` folder in this home directory. Then modify the listening port to port 8080.

## Session 4: Scripting

### CHALLENGE: Bash Scripts

**User:** `bashchallenge`

A service on this machine expects the correct username and password to login. You have a list of usernames and passwords to test, but this lists are too long to attempt manually. The service runs on network port 9999 and expects to receive credentials in the form of `username:password`.

Write a bash script to "brute force" every username/password combination to find the correct one.

To start the service, first run `/opt/bashchallengesvc &`

## Session 5: Containers

### CHALLENGE: Docker

**User:** `dockerchallenge`

A Docker image is available on this machine. Run a shell in it in interactive mode, and seek the flag in common locations.
