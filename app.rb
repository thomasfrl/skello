require 'bundler'
Bundler.require
$:.unshift File.expand_path('./..', __FILE__)
require 'model/post'
require 'model/comment'

puts Post.all.first.content

