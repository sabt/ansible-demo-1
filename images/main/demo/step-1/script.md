# Step-1

## Preparation

If this is the first time after starting the container, run `ansible-playbook -i inventory.yaml load-ssh-hostkeys.yaml`.
This is necessary to make the ssh-keys of all targets known to the ssh client and to prevent warnings and connection problems in ansible.

## Execution

    ansible -i inventory.yaml -m ping all

    ansible-playbook -i inventory.yaml step-1.yaml
