class ApplicationController < Sinatra::Base
	get '/' do
    erb :index, :layout => :layout, locals: {posts: Post.all}
  end
  get '/post/:id' do |id|
    erb :show, :layout => :layout, locals: {post: Post.all[id.to_i], comments: Comment.select(id) }
  end
end
