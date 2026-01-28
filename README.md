Step 1: Create the file

touch /home/demo.txt


Step 2: Change file permissions

chmod 764 /home/demo.txt


Step 3: Check permissions (optional)
ls -l /home/demo.txt

You will see something like:
-rwxrw-r-- demo.txt


Permission breakdown

rwx  → owner
rw-  → group
r--  → others
