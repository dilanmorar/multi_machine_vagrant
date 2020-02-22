# Multi Machine Vagrant

This is a repo for running a nodejs app and linking it to a database. We will have the app and the database running on two seperate virtual machines.

## Virtual Machines

A virtual machine allows you to run an operating system on your desktop and it behaves like its own seperate computer. It allows you to create an environment which only contains the dependencies you require.

## Provisioning

### App

In the app provision folder we updated the sources list and upgraded any of the packages available. We then installed nginx, git, nodejs and a package manager (pm2).

### Database

In the database provision folder wegot a key that gives access to the repository. We then added this to our source list and then updated the source list. Then installed mongod 3.2.20. Then removed the mongod.conf on the virtual machine and replaced it with a new one which included the bindIp of 0.0.0.0 and port 27017. Finally restarted and enabled mongod.

## Requirements
Downloads required:
- download vagrant 2.2.6
- download oracle vm virtualbox 6.0.14

## Running the App

first go into the directory that contains the repo

in the command line run the following code to start running the virtual machines:
```
vagrant up
```
in the command line run the following code to enter into the app virtual machine:
```
vagrant ssh app
```
in the command line run the following code to enter into the app file:
```
cd /home/ubuntu/app
```
in the command line run the following code to populate the posts page:
```
node seeds/seed.js
```
in the command line run the following code to install the npm (node packaging manager):
```
npm install
```
in the command line run the following code to start running the app:
```
node app.js
```

## Loading the App

- in web browser type http://development.local:3000/
- to see the posts in the browser type in http://development.local:3000/posts

## Testing

- download ruby
- install bundle

## Using Ansible

sudo apt-add-repository ppa:ansible/ansible
sudo apt update
sudo apt install ansible
