# Linux-scripts

This script will create a main.yml and will include this basic playbook structure:

```
hosts: 
gather_facts:
become: true
tasks:

   name: Execute the command in remote shell
   ansible.builtin.shell: ls /
   register: output
```

Example Usage
-------------

```
bash create-playbook.sh -h lab -g false
```

Usage:
-------------

```
Usage: create-playbook [-h] [-g]
Requires:
-h    hosts name group in your inventory file
-g    gather fact value true or false
```


