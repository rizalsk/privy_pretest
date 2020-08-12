# PRETEST M. SYAMSU RIJAL


### 1. Requirement

    - Rails version: 5.1.7 installer : https://rubyonrails.org
    - Mysql
    - Git Bash 
    - Ruby version: 2.3.3 (i386-mingw32)


> note : Open directory and open Git Bash or CMD or Terminal
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
3. seeder
```sh
$ rails db:seed
```


### 3.1 Database seeder users for login

| Username | Email | Password |
| ------ | ------ | ------ |
| admin | admin@example.com | password |
| john | john@example.com | password |
| robert | robert@example.com | password |
| tina | tina@example.com | password |

### 3.1 Run Rails Server
> note : -p:3001 (Port = 3001), Url : 127.0.0.1:3001

```sh
$ rails s -p 3001
```

**Note : Don't forget to migrate and seed your database everytime**