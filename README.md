# PRETEST M. SYAMSU RIJAL


### 1. Requirement

    - Rails version: 5.1.7 installer : https://rubyonrails.org
    - Mysql
    - Git Bash 
    - Ruby version: 2.3.3 (i386-mingw32)

### 2. Update bundle

Run cmd : bundle install

### 3. Add Mysql database
**note : change mysql password in config/database.yml if needed**

Run cmd :

1. create database:
```sh
$ rails db:create or rake db:create
```
2. migrate
```sh
$ rails db:migrate
```
3. migrate
```sh
$ rails db:seed
```


### 3.1 Db seed users for login

| Username | Email | Password |
| ------ | ------ | ------ |
| admin | admin@example.com | password |
| john | john@example.com | password |
| robert | robert@example.com | password |
| tina | tina@example.com | password |
