# Step-3

## Purpose

Show multiple plays and host selection in playbooks. Show variables for hosts and groups.

Show: 

- Show variables defined in inventory.
- Show playbook with multiple plays.
- Show host selection in playbook.

## Execution

    ansible -i inventory -m ping 'all:!webserver'

    ansible-playbook -i inventory step-3.yaml

