#!/usr/bin/env bash

echo 'Running Vagrant'

echo 'Create Multiple Virtual Machines'
sleep 10

echo 'Create DB Virtual Machine'
vagrant up db
sleep 10

echo 'Crate APP Virtual Machine'
vagrant up app
slepp 10
