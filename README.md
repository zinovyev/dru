# DRU

A ruby-in-docker toolbox

## INSTALLATION

```bash

sudo curl -s https://raw.githubusercontent.com/zinovyev/dru/master/dru -o /usr/bin/dru && sudo chmod +x /usr/bin/dru

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
Unable to find image 'ruby:2.7-rc-slim' locally
2.7-rc-slim: Pulling from library/ruby
fc7181108d40: Pull complete 
fb832b8d529e: Pull complete 
f928adca00a3: Pull complete 
dcd7b9892d7b: Pull complete 
280bf30ffe85: Pull complete 
Digest: sha256:7b59fc30497d8318c09b456aefe0aef381529bed55768d06d77beb5ff07797f8
Status: Downloaded newer image for ruby:2.7-rc-slim
Ignoring nio4r-2.3.1 because its extensions are not built. Try: gem pristine nio4r --version 2.3.1
Ignoring nokogiri-1.10.3 because its extensions are not built. Try: gem pristine nokogiri --version 1.10.3
Ignoring websocket-driver-0.7.1 because its extensions are not built. Try: gem pristine websocket-driver --version 0.7.1
irb(main):003:0> RUBY_VERSION
=> "2.7.0"

```

**Create a new rails project in the current directory without installing rails locally**

```bash

$ dru rails -r '6.0.0.rc1' -d "${PWD}/testdir" -e 'new ./ --database=postgresql'
       exist  
      create  README.md
      create  Rakefile
...
* bin/rake: Spring inserted
* bin/rails: Spring inserted
       rails  webpacker:install
$ ls testdir 
app  bin  config  config.ru  db  Gemfile  Gemfile.lock  lib  log  package.json  public  Rakefile  README.md  storage  test  tmp  vendor

```

## USAGE

```bash

COMMANDS:
dru run       Runs sh in ruby conainer
dru irb       Runs irb in ruby conainer
dru rails     Runs rails command in the container
dru update    Updates dru to the latest stable release
dru uninstall Removes dru from your machine

OPTIONS:
-d or --dir   Mount directory (default: current directory)
-t or --tag   Tag of ruby image (default: alpine)
-e or --exec  Execute a custom command in the container

```
