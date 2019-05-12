require 'model/post'
require 'model/comment'
class ApplicationController < Sinatra::Base
	get '/' do
    erb :index, :layout => :layout, locals: {posts: Post.all}
  end
  get '/posts/:id' do |id|
    erb :show, :layout => :layout, locals: {post: Post.find(id.to_i), comments: Comment.select(id.to_i) }
  end
  post '/posts/' do 
    redirect "/posts/#{id}"
  end
  post '/comments/:post_id' do |post_id|
    Comment.new(post_id.to_i, params["content"]).save
    redirect "/posts/#{post_id}"
  end

end
