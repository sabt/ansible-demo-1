apache
=========
This role installs apache in webservers with handlers and version as variable


Requirements
------------
na

Role Variables
--------------
apache_package - version of apache to be installed


Dependencies
------------
na

Example Playbook
----------------
---
- name: Install and configure Apache
  hosts: webserver
  become: true
  roles:
    - apache

License
-------
na

Author Information
------------------
Akshaya.Parthasarathy@gft.com
