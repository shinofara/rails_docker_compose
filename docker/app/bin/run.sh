#!/bin/bash

# 更新があればinstall
bundle check || bundle install
bundle exec puma -C config/puma.rb
