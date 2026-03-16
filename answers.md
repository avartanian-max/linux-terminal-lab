## File Navigation and Links

- You have a symlink pointing to /etc/config/settings.txt. The sysadmin moves that file to /etc/config/old/settings.txt and creates a new file at the original path. Your symlink still works, but now points to different data. Why did this happen and how could you have prevented it?

The link still works because its still points to /etc/config/settings.txt so when you move the file the link makes a new file at the same path. To fix this you would update the symlink whenever the file changes and point the symlink to the new target directory.


- You delete all hardlinks to a file, but the inode still exists and the data isn’t freed. What’s keeping the file alive? (Hint: think about what has the file open)

The file is running somewhere because as long as there is one link, the data will still exists in the inode.

- You create 10 hardlinks to a file and then delete the original. You edit one of the hardlinks and add 50 lines. How many of the remaining hardlinks now have 150 lines, and why?

All of the files have the lines because as long as one link is still there the data exists so the data will be updated and changed for all 10 new hardlinks.

- You’re setting up a configuration system where a symlink in `/home/user/config` should always point to the active config in `/opt/configs/`. Why would a relative symlink break here but an absolute one wouldn’t?


A relative symlink would break if the symlink gets moved to another directory while an absolute one always points to the full path so it will keep working as long as the path exists.

## File Permissions

- You set a file to 644 but users in the group still can’t read it. The file owner is you. What could be wrong, and how would you systematically debug this?

  644 gives read access to people in group an issue is that one of the parent directories does not have this permission so the person in the group can't get through to the final destination. I would grant permission to read for the parent directories of the file. and use the command ls -l to get the current permissions of the file and the entire path to the file.

  
- A script is 755 and owned by root. A regular user can execute it, but when the script tries to write to a file in /var/log/, it fails with “Permission denied”. Why, and what’s the security implication?

  755 only allows the user to run the script the permission is different for the actual owner of the file so it can't write into the logs since it only has permission to run the script. If it could write into the logs  the owners secruity could be at risk allowing normal users to access those files.

- Your application needs to create files in /tmp that only the owner can read, but it needs to be run by multiple different users. If you just chmod 600 the directory, what breaks and why?

Directories need execute permission to be traversed through with a chmod 600; the owner can only read and write but nobody can execute so not even the owner can enter the directory.

  - You have a directory that’s drwxr-xr-x but you want to prevent others from listing the contents while still letting them access files if they know the name. What permission would you use and why does the execute bit matter here?

  I would use permission 711 which allows the execute permission but not the read permission and without the read permission the user cant use the ls command to figure out file names so they can only access it if they know the exact name.

## Shell Scripts

- You write a script with #!/bin/bash but it still fails when run as ./script.sh from the cron daemon. The same script works fine when you run it manually. What’s likely wrong?

If the script has variables like HOME it wont have those variables in Cron Daemon as its not in the shell terminal we are in.

- A script uses read NAME but you’re piping input to it: echo "John" | ./script.sh. The script doesn’t receive the name. Why, and how would you fix it?

You should accept the value of the name in the line you call the script like typing "./script.sh John"

- You pass 5 arguments to a script but only use $1 and $2. You later realize you need to pass the remaining arguments to another command: some_command $@. What’s the difference between $@ and $* and when does it matter?

$@ preserves each argument as a seperate word while $* joins all the arguments together in one string it matters when you are typing arguments that contain special charcters or spaces

- You have a function that returns 1 on error, but your script doesn’t check the return value and continues anyway. Later, your script appears to run successfully but actually failed silently. How would you structure your script to catch errors earlier?

Whenever an error would happen exit the script and return a error msg|

- You write a loop: for file in *.txt; do process $file; done. If a filename has spaces in it, what breaks and how would you fix it?

If the file name has spaces it may not read the file correctly instead if we do "$file"; it will read the input even with spaces so anytime we call for $file we put it in quotes.

## System Administration Basics

- uptime shows a load of 8.0 on a 4-core system. What does this actually tell you about system health, and why is it not as simple as “the system is overloaded”?

It tells us that there are on average 8 tasks needing the CPU and its not simple because we need more information from the CPU stats and the memory to see if the system is truely being overloaded or not.

- You discover /home is 95% full. You run du -sh /home/* but the sum is way less than the total size. Where did the space go and how would you actually find it?

The space could be in hidden files which in our command we would include the search to hidden files, or it could be data that was deleted but still has a process running on it keeping it alive.

- You see a process in htop using 50GB of memory but ps aux shows it only allocated 2GB. How is this possible and what’s the difference between what these tools are measuring?
Different tools report different memory concepts a process can allocate a huge amount of memory vrirtually without having it all in RAM so the difference you see is usually between virtual and resident memory and how the different tools see them.

- You add an environment variable to ~/.bashrc by appending a line, but when you open a new terminal it’s not there. You double-check the file and the line is there. What’s wrong?
  
  The shell environment may not be reading it correctly depending on how the terminal starts bash it maybe reading ~profile instead of ~bash profile.

- A service is crashing repeatedly. You check journalctl but the last log entry is from 10 minutes ago, even though you know it crashed 30 seconds ago. Where else would you look for logs and why?

Check /var/logs/ as some applications to log to journalct1 they log their crashes elsewhere

## Networking Basics

- You run nc -zv server.com 8080 and it times out, but ping server.com succeeds. The server admin says the service is definitely running. What layer of the network stack is the problem at, and how would you prove it?

The likely issue is at the TCP layer or firewall level since the fact that ping server.come succeeds proves that the host is reachable at the network layer to prove it test the port with nc and inspect the packets using tcpdump and check what you get back.

- You compare ss -tuln and netstat -tuln output on the same system and get slightly different results. Why might this happen and which one should you trust?

The tools likely gather data differently ss is a newer tool and is usually perceived as faster and the better tool.

- You want to SSH to a server on port 2222, but you also need to forward a local port for development. What would your full command look like and why might this be safer than opening port 22?

ssh -p 2222 -L 8080:localhost:3000 username@servername

- traceroute server.com shows 20 hops but ping server.com returns in milliseconds. Something is very wrong. Is the server definitely reachable and why would traceroute show so many hops?

Traceroute and ping use different packet types which can be handled different many routers prioritize ping so a long traceroute outpot isnt a sign that the server is bad in anyway.

- You want to copy a 10GB file from a remote server but scp keeps timing out. What could be wrong, and what’s a more robust approach?

The connection from you to the server may be bad or might be getting limitted from the download a better choice would be to do the copy in smaller segments





  
