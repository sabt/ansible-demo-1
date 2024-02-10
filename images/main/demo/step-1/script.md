# Step-1

## Purpose

Show ansible basics:

- Inventory
- Ansible CLI tool
- Use 'ping' to show connectivity
- Use 'shell' to run a command on remote hosts
- Use 'setup' to show all ansible knows about the host

## Execution

    ansible -i inventory --list-hosts all

    ansible -i inventory -m ping all

    ansible -i inventory -m shell -a "cmd='ls -l /tmp'" all

    ansible -i inventory -m setup all

