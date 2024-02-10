# Step-2

## Purpose

Show ansible inventroy 'alias' names and a first playbook.

Show: 

- Variable 'ansible_host' in inventory.
- Show --list-hosts and 'ping' to show connection with alias names.
- Show playbook basics
- Use playbook to show difference between alias name and real hostname

## Execution

    ansible -i inventory --list-hosts all

    ansible -i inventory -m ping all

    ansible-playbook -i inventory step-2.yaml