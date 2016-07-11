require 'rack'
require 'rubygems'
require 'active_record'
require 'bundler/setup'
require 'grape'
require './app/base'
require './app/api/messages'
require './app/models/message'

use ActiveRecord::ConnectionAdapters::ConnectionManagement

run Messages
