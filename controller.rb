require 'model/post'
require 'model/comment'
class ApplicationController < Sinatra::Base
	get '/' do
    erb :index, :layout => :layout, locals: {posts: Post.all}
  end

  get '/posts/:id' do |id|
    erb :show, :layout => :layout, locals: {post: Post.find(id.to_i), comments: Comment.select(id.to_i) }
  end

  
  post '/posts' do 
    po = Post.new(title: params["title"], content: params["content"],rating: params["rating"],photo: params["photo"]).save
    redirect "/posts/#{po.id}"
  end

  get '/posts/new/form' do
    erb :new, :layout => :layout
  end

  post '/comments/:post_id' do |post_id|
    Comment.new(post_id: post_id.to_i, content: params["content"]).save
    redirect "/posts/#{post_id}"
  end

end
