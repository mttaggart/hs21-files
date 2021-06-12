# Quizzes/Challenges

## Session 0

**User:** `start0:HS21{lets_begin}`

### Linux Basics

**User:** `start1`

1. Who was the creator of Linux? **Linus Torvalds**
2. Where was the UNIX Operating System created? **Bell Labs**
3. Ubuntu, Fedora, SUSE, and Debian are examples of Linux \_\_\_\_\_\_. **Distributions/Distros**
4. Why are we allowed to use Linux without paying for it? **Open source**

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

### CHALLENGE

**User:** `cmdchallenge`

In this challenge, you have to find the pieces of the flag and put them together into a single file. For the sake of ease, we will use `>>` to put the flag pieces on separate lines in the file `flag.txt`, which you need to create. Inside the `parts/` folder are several files that may contain parts of the flag. You'll have to use the tools you have learned so far to discover the flag parts and put them together in order.

## Session 2: Vim

**User:** `vim01`

1. How do you enter insert mode? **i**.
2. How would we find and replace every exclamation point with a question mark in the current buffer? **%s/!/?/g**
3. How would we ask for help on what the `x` key does? **:h x**
4. How do we save and quit with a single command? **x**

## Sesssion 3: Networking

### IP Basics

**User:** `net01`

1. What is this machine's IP address?
2. How many network interfaces are configured?
3. What is the default gateway? 
4. Enter the command to ping `google.com` 5 times. **ping -c 5 google.com**

### Clients and Servers

**User:** `net02`

1. What is the default HTTP port? **80**
2. Use netcat to connect to <<URL>>. What is the flag?

### CHALLENGE

**User:** `netchallenge`

Install `nginx`. Modify the server root to point to the `website` folder in this home directory. Then modify the listening port to port 8080.

## Session 4: Scripting

### CHALLENGE: Bash Scripts

**User:** `bashchallenge`

A dump of user credentials has appeared on the dark web. The dump has been saved in `users.txt`. The format of the file is `user:password`, The passwords are base64 encoded. The users appear to be for a service listening on `localhost:9999`. 

For each username/password pair, use `nc` to send the username and password, separated by a newline. The correct username/password pair will grant a flag.

## Session 5: Containers

### CHALLENGE: Docker

**User:** `dockerchallenge`

Download and run the docker image `taggarttech/hs21-docker`. Run it in interactive mode, with a terminal. Run a shell, and grab the flag.
