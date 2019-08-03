# AEM 
### (python script, which makes a life little bit easier)
Script will help you to simplified process of start/stop AEM instance(s)
### Notes
  -  It works for Linux (Tested on Ubuntu 17.10)
  -  Python version was 2.7.14


### Features. It can:

  - find and all envs, under /home/<user>/.. directory and print results
  - print info about active envs(id, pid, path, debugPort, runMods)
  - run(start) env by id
  - stop env by id


### ATTENTION:
 
   - AUTHOR ISN'T RESPONSIBLE FOR THE USE OF THIS SCRIPT.
   - THE USER(S) USE(S) THIS SCRIPT ON HIS/HER/THEM OWN RISK.

###  WARNING: 
   - I'M NOT RECOMMENDED USE THIS SCRIPT ON PRODUCTION SERVER(S)


### Installation

 - Download arhcive [AEM-Script.1.1.0.zip](https://github.com/AntonKrynytskyi/aem-script/raw/master/archive/AEM-Script.1.1.0.zip)
 - Extract file in some directory
 - Open terminal in this directory, about which we mentioned in previous item
 - Run next commands:
```sh
$ chmod 555 init.sh
$ sudo ./init.sh
```
 - That's all, now you can use "$ aem" command through terminal

### How does it works?
#### Little demo

##### First run:
```sh
> $ aem
```
> Note: will find all env(s) path and write them to cash.txt file and print "[cash.txt file was updated]" msg

```sh
$ aem
[> aem_ (Script is running)]
[sudo] password for user1: 
------------------------------------------------
[cash.txt file was updated]
------------------------------------------------
------------------------------------------------
[ATTENTION]: You have not any active instances!
------------------------------------------------
------------------------------------------------
[MSG(INFO)>'List of avalible instances!']:
------------------------------------------------
[ID: 2]: [PATH:/home/user1/lab/aem/ame6_cluster/author]
[ID: 4]: [PATH:/home/user1/lab/aem/author]
[ID: 1]: [PATH:/home/user1/lab/aem/ame6_cluster/author1]
[ID: 3]: [PATH:/home/user1/lab/aem/pub1]

[> aem_ (Script was finished)]
```

##### Second run(when no active aem env(s)):
```sh
> $ aem
```
> Will print env(s)'s path(s) from cash.txt file

```sh
$ aem
[> aem_ (Script is running)]
------------------------------------------------
[ATTENTION]: You have not any active instances!
------------------------------------------------
------------------------------------------------
[MSG(INFO)>'List of avalible instances!']:
------------------------------------------------
[ID: 2]: [PATH:/home/user1/lab/aem/ame6_cluster/author]
[ID: 4]: [PATH:/home/user1/lab/aem/author]
[ID: 1]: [PATH:/home/user1/lab/aem/ame6_cluster/author1]
[ID: 3]: [PATH:/home/user1/lab/aem/pub1]

[> aem_ (Script was finished)]
```

##### Second run(when exist some active aem env(s)):
```sh
> $ aem
```
> Before was run "$ aem" command, at the system was already been activated publisher1 instance.

```sh
$ aem
[> aem_ (Script is running)]
/home/user1/lab/aem/pub1
[ID-------]: 3
[PID------]: 20502
[RunMods--]: publish,crx3,crx3tar
[Port-----]: 4503 
[DebugPort]: {n/a}
[EnvPath--]: /home/user1/lab/aem/pub1

------------------------------------------------
[MSG(INFO)>'Ran envs]: ( 1)
------------------------------------------------

[> aem_ (Script was finished)]
```

##### Start env
```sh
> $ aem -s <id>
```
> Will start instance by id(Current user has an author instance with id = 4)
> Note: not always a log will be printed at the terminal, but an instance will be started anyway.  It's known issue.
```sh
$ aem -s 4
[> aem_ (Script is running)]
------------------------------------------------
[MSG(INFO)>Starting.. [ID: 4]: [PATH:/home/user1/lab/aem/author]]:
------------------------------------------------
...
```

##### Start an env with no exist id
> Will print error msg
```sh
$ aem -s 777
[> aem_ (Script is running)]
------------------------------------------------
[cash.txt file was updated]
------------------------------------------------
------------------------------------------------
[MSG(ERROR)>'ID not found 404!']: '777'. Env with current ID doesn't exist yet.
------------------------------------------------
```

##### Stop an env by ID
```sh
> $ aem -e <id>
```

```sh
$ aem -e 4
[> aem_ (Script is running)]
/home/user1/lab/aem/author
------------------------------------------------
[MSG(INFO)>'stop script was run: ']: '4'
------------------------------------------------
17.11.2018 13:43:45.833 *INFO * [main] Setting sling.home=. (command line)
17.11.2018 13:43:45.847 *INFO * [main] Sent 'stop' to /127.0.0.1:46643: OK
/home/user1/lab/aem/author/crx-quickstart/bin/stop: 15: [: 0: unexpected operator
Stop command returned 0. Trying to kill the process...
process 24021 was killed
------------------------------------------------
[MSG(INFO)>'stop script finished!'] 
------------------------------------------------
```

##### Stop an env by ID, which doesn't active or id doesn't exist
```sh
> $ aem -e <id>
```

```sh
$ aem -s 777
[> aem_ (Script is running)]
------------------------------------------------
[cash.txt file was updated]
------------------------------------------------
------------------------------------------------
[MSG(ERROR)>'ID not found 404!']: '777'. Env with current ID doesn't exist yet.
```
##### Update cash.txt file
```sh
> $ aem -u 
```

```sh
$ aem -u
[> aem_ (Script is running)]
------------------------------------------------
[cash.txt file was updated]
------------------------------------------------
------------------------------------------------
[MSG(INFO)>'List of avalible instances!']:
------------------------------------------------
[ID: 2]: [PATH:/home/user1/lab/aem/ame6_cluster/author]
[ID: 4]: [PATH:/home/user1/lab/aem/author]
[ID: 1]: [PATH:/home/user1/lab/aem/ame6_cluster/author1]
[ID: 3]: [PATH:/home/user1/lab/aem/pub1]

```

##### Will show all available instances to start/stop
```sh
> $ aem -i 
```

```sh
$ aem -i
[> aem_ (Script is running)]
------------------------------------------------
[MSG(INFO)>'List of avalible instances!']:
------------------------------------------------
[ID: 2]: [PATH:/home/user1/lab/aem/ame6_cluster/author]
[ID: 4]: [PATH:/home/user1/lab/aem/author]
[ID: 1]: [PATH:/home/user1/lab/aem/ame6_cluster/author1]
[ID: 3]: [PATH:/home/user1/lab/aem/pub1]

[> aem_ (Script was finished)]
```

##### Will kill process through "kill -9 pid" command
```sh
> $ aem -k <id> 
```

```sh
$ aem -k 4
[> aem_ (Script is running)]
/home/user1/lab/aem/author
------------------------------------------------
[MSG(INFO)>' Process(pid: 27308) was killed.]
------------------------------------------------

[> aem_ (Script was finished)]
```

##### Will try to kill process with doesn't active env
```sh
> $ aem -k <id> 
```

```sh
$ aem -k 777
[> aem_ (Script is running)]
------------------------------------------------
[MSG(ERROR)>'ID not found 404!']: '777'. Env with current ID doesn't run yet.
------------------------------------------------

[> aem_ (Script was finished)]
```
##### Will be provided a short documentation
```sh
> $ aem -help 
```

```sh
$ aem -help
[> aem_ (Script is running)]
##########################################################
#     Script will help you to simplified process of      #
#            start/stop AEM instance(s)                  #
##########################################################


        -s <id> // s={start}    run instance by id
        -e <id> // e={end/stop} stop instance by id
        -k <id> // k={kill}     kill instance by id
        -i      // i={info}     provide info about exist instances under /home/<loged-in_user>/..
        -u      // u={update}   update cash file


##########################################################
# If you want to contribute, then you can use next info: #
# GitHub:                                                #
#       https://github.com/AntonKrynytskyi/aem-script    #
# Email:                                                 #
#       AntonKrynytskyi@gmail.com                        #
# You can communicate with me or create a merge request  #
# on GitHub repository.                                  #
##########################################################

[> aem_ (Script was finished)]
```

### Todos
 - Adapt script for MacOS


**Free Software, Hell Yeah!**
### Download arhcive [AEM-Script.1.1.0.zip](https://github.com/AntonKrynytskyi/aem-script/raw/master/archive/AEM-Script.1.1.0.zip)
