require 'bundler'
Bundler.require
$:.unshift File.expand_path('./..', __FILE__)
require 'model/post'
require 'model/comment'

p = Post.new(title:"jkjkj", id:5, rating:3, content:"hjhjhjh hj j j ig o yu yu yuo")
puts p.content
# puts Post.all.first.content
