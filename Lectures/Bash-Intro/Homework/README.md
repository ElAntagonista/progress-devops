# Prerequisites
1. Please make a Github repo that you would use for all homeworks given in this course. **!NB The repo should be private.**


    [ How to make a github repo ](https://help.github.com/en/github/getting-started-with-github/create-a-repo )

    [Setting up git and connecting to Github repo](https://help.github.com/en/github/getting-started-with-github/set-up-git#setting-up-git)
2. Create a branch out of master.
  
   Naming convention for the branch name:
   `DEVOPS-`< Lecturename >
   
   **Example**: DEVOPS-Bash-Intro
   
3. In your repo create a folder named after the Lecture name. In this case it would be **Bash-Intro**
4. Each script's name should match it's task.
   
   E.g. `task-1.sh` -> for Task-1 
5. Add me as a contributor to your repo so that I can view and collaborate on your work.
6. Once you feel confident enough regarding your work
create a pul request and add me as a reviewer

    [How to create a pull request](https://help.github.com/en/github/collaborating-with-issues-and-pull-requests/creating-a-pull-request)

----------

# Tasks

## Task-1

You'd like to know whether the packages **python3** and **python3-pip** are installed on the
Ubuntu server that you are working on.
Write a simple script that will check that for you and will output `<package> is installed` if it's already installed on the machine and `<package> is nowhere to be found` if the package is not installed.
**Example Output**

    python3-pip is installed
    python3 is installed

**Hints**
- you could use `dpkg` command to check if a given package is installed 
- in order to omit the std output and std err from the command you'd need to redirect both to somewhere(?) 

## Task-2
Your manager would like to know who uses sudo and how often.
You've been tasked to write a script that should take one argument **(a username)** and given that username it should output the number of times this user has used sudo.
**Example Output**

    User vagrant has used sudo 21 times
    

**Hints**
- work with the file _/var/log/auth.log_
- you need to be sudo to read it :)


## Task-2-a
**This is an optional task!**
Change the script from Task-2 to output to a file the same thing from the previous command + all unique commands the user has used. The file with the output should have the following naming structure:
    
    <username>-Y-m-d.txt
    E.g.: vagrant-2020-02-11.txt
The file should be saved in the same directory where the script runs.

**Example Output**

    User vagrant has used sudo 300 times
    /usr/bin/apt install jq
    /usr/bin/apt install python-pip
    /usr/bin/apt install python-pip3
    /usr/bin/apt install python3-pip
    /usr/bin/apt update
    /usr/bin/crontab -l
    /usr/bin/touch test.log
    /usr/bin/whoami
    /usr/sbin/visudo

**Hints**
- use the `sort -u` command to get unique lines and sort


