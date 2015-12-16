#!/bin/bash

ansible-playbook ./playbook.yml -f 10 -i ./inventories/local --ask-sudo-pass