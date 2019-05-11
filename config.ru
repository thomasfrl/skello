require 'bundler'
Bundler.require
$:.unshift File.expand_path('./..', __FILE__)
require 'controller'

run ApplicationController