## File Navigation and Links

- You have a symlink pointing to /etc/config/settings.txt. The sysadmin moves that file to /etc/config/old/settings.txt and creates a new file at the original path. Your symlink still works, but now points to different data. Why did this happen and how could you have prevented it?

The link still works because its still points to /etc/config/settings.txt so when you move the file the link makes a new file at the same path. To fix this you would update the symlink whenever the file changes and point the symlink to the new target directory.


- You delete all hardlinks to a file, but the inode still exists and the data isn’t freed. What’s keeping the file alive? (Hint: think about what has the file open)

The file is running somewhere because as long as there is one link, the data will still exists in the inode.

- You create 10 hardlinks to a file and then delete the original. You edit one of the hardlinks and add 50 lines. How many of the remaining hardlinks now have 150 lines, and why?

All of the files have the lines because as long as one link is still there the data exists so the data will be updated and changed for all 10 new hardlinks.

- You’re setting up a configuration system where a symlink in `/home/user/config` should always point to the active config in `/opt/configs/`. Why would a relative symlink break here but an absolute one wouldn’t?


A relative symlink would break if the symlink gets moved to another directory while an absolute one always points to the full path so it will keep working as long as the path exists.
