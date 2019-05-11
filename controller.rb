class ApplicationController < Sinatra::Base
	get '/' do
    erb :index, :layout => :layout
  end
end
