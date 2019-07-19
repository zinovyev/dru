# DRU

A ruby-in-docker toolbox

[![Build Status](https://travis-ci.org/zinovyev/dru.svg?branch=release-0.1.0)](https://travis-ci.org/zinovyev/dru)

> This library is currently under development. Some options and methods may change in a time.

## INSTALLATION

```bash

curl -s https://raw.githubusercontent.com/zinovyev/dru/master/dru | sudo sh -c 'cat > /usr/bin/dru && chmod +x /usr/bin/dru'

```

## EXAMPLES


**Run a docker container with the latest alpine ruby image**

```bash

$ dru run
/usr/src # ruby -v
ruby 2.6.3p62 (2019-04-16 revision 67580) [x86_64-linux-musl]

```

**Run the irb shell**

```bash

$ dru irb -t '2.7-rc-slim'
irb(main):003:0> RUBY_VERSION
=> "2.7.0"

```

**Create a new rails project in the current directory without installing rails locally and initialize docker-compose project for a local development.**

```bash

$ dru rails -r '6.0.0.rc1' -e 'new . --database=postgresql'
$ ls
app  bin  config  config.ru  db  Gemfile  Gemfile.lock  lib  log  package.json  public  Rakefile  README.md  storage  test  tmp  vendor
$ dru project
$ ls
app  bin  config  config.ru  db  docker-compose.yml  Dockerfile  Gemfile  Gemfile.lock  lib  log  package.json  public  Rakefile  README.md  storage  test  tmp  vendor

```

## USAGE

```bash

COMMANDS:
dru run       Runs sh in ruby conainer
dru irb       Runs irb in ruby conainer
dru rails     Runs rails command in the container
dru project   Generate Dockerfile and docker-compose.yml files
dru update    Updates dru to the latest stable release
dru uninstall Removes dru from your machine

OPTIONS:
-d or --dir   Mount directory (default: current directory)
-t or --tag   Tag of ruby image (default: alpine)
-e or --exec  Execute a custom command in the container

```
