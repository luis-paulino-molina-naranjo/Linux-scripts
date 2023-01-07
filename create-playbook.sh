#!/usr/bin/bash

hosts=""
gather_facts=""
usage() {

cat <<EOF
Usage: create-playbook [-h] [-g]

Requires:
-h    hosts name group in your inventory file
-g    gather fact value true or false
EOF
}

create_main() {

cat <<EOF >main.yml
---
- hosts: $hosts
  gather_facts: $gather_facts
  become: true
  tasks:

  - name: Execute the command in remote shell
    ansible.builtin.shell: ls /
    register: output
EOF

echo 
echo "main.yml file created "
echo
}

 while getopts ":h:g:" OPTION; do
  case "$OPTION" in 
    h)
      hosts=$OPTARG
      ;;

    g)
     #Is required to validate the value of gather facts
      gather_facts=$OPTARG
      create_main
      ;;

    *) 
      usage
      exit 1
      ;;
  esac
done

#If the -g parameter is empty
if [ -z "$3" ]; then
usage
exit 1
fi

#cleanup first parameter
shift $((OPTIND-1))




