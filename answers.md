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


  
