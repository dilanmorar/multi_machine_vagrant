# Running the app

## Requirements
Downloads required:
- download vagrant 2.2.6
- download oracle vm virtualbox 6.0.14

## Running the App

first go into the directory that contains the repo

in the command line run the following code to start running the virtual machine:
```
vagrant up
```
in the command line run the following code to enter into the virtual machine:
```
vagrant ssh app
```
in the command line run the following code to enter into the app file:
```
cd /home/ubuntu/app
```
in the command line run the following code to install the npm (node packaging manager):
```
npm install
```
in the command line run the following code to start running the app:
```
npm start
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
