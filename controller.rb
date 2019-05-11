class ApplicationController < Sinatra::Base
	get '/' do
    erb :index, :layout => :layout, locals: {posts: Post.all}
  end
  get '/post/:id' do |id|
    erb :show, :layout => :layout, locals: {post: Post.find(id.to_i), comments: Comment.select(id.to_i) }
  end
end
