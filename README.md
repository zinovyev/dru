# DRU


Run any Ruby or Rails command without need to install them locally.

[![Build Status](https://travis-ci.org/zinovyev/dru.svg?branch=release-0.1.0)](https://travis-ci.org/zinovyev/dru)

> This utility is under active development. Some commands and options may change in a time.


## Installation

```bash
$ curl -s https://raw.githubusercontent.com/zinovyev/dru/master/dru | sudo sh -c 'cat > /usr/bin/dru && chmod +x /usr/bin/dru'
```

## Update

```bash
$ dru update
```

## Examples


**Run a docker container with the latest alpine ruby image**

```bash
$ dru shell
/usr/src # ruby -v
ruby 2.6.3p62 (2019-04-16 revision 67580) [x86_64-linux-musl]
```

**Run the irb shell**

```bash
$ dru irb -t '2.7-rc-slim'
irb(main):003:0> RUBY_VERSION
=> "2.7.0"
```

**Create a new 6.0.0.rc1 Rails project in the current directory...**

```bash
$ dru rails -r '6.0.0.rc1' -e 'new . --database=postgresql'
$ ls
app  bin  config  config.ru  db  Gemfile  Gemfile.lock  lib  log  package.json  public  Rakefile  README.md  storage  \
test  tmp  vendor
```

**...and then initialize a docker-compose project for a local development**

```bash
$ dru project
$ ls
app  bin  config  config.ru  db  docker-compose.yml  Dockerfile  Gemfile  Gemfile.lock  lib  log  package.json  \
public  Rakefile  README.md  storage  test  tmp  vendor
```

## Commands

```
dru shell     Runs sh in ruby conainer
dru irb       Runs irb in ruby conainer
dru rails     Runs rails command in the container
dru project   Generate Dockerfile and docker-compose.yml files
dru update    Updates dru to the latest stable release
dru uninstall Removes dru from your machine
```

## Options

```
-d or --dir   Mount directory (default: current directory)
-t or --tag   Tag of ruby image (default: alpine)
-e or --exec  Execute a custom command in the container
```

