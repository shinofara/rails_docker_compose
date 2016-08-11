
## Install xbuild

```
$ git clone https://github.com/tagomoris/xbuild.git
```

## Install Ruby 2.3

```
$ ./xbuild/ruby-install 2.3.0 ~/local/ruby-2.3
$ export PATH=/Users/shinofara/local/ruby-2.3/bin:$PATH
```

## Install Rails 5.0.0 beta3

```
$ gem install rails -v 5.0.0.beta3
```

## Create Sample App

```
$ rails new sample
```

## Run Sample App

```
$ cd sample
$ rails server
```

## Build Docker Container

```
$ docker-compose build
```

## Run Rails Server On Docker Container

```
$ docker-compose up
```

## Send mail

```
$ rails runner Tasks::Sendmail.execute
```