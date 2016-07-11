RACK_ENV = (ENV['RACK_ENV'] || 'development').to_sym
require 'rubygems'
require 'bundler'
require 'bunny'
Bundler.require

app_base = "#{File.dirname(File.expand_path(__FILE__))}/.."

Grape::ActiveRecord.configure_from_file! "config/database.yml"
