require_relative './spec_helper.rb'
require 'controller'

RSpec.describe ApplicationController  do
  describe "get index post" do
    it 'returns a success response' do
      get '/'
      expect(last_response).to be_ok
    end
  end

  describe "get show post" do
    it 'returns a success response' do
      id = Post.all.sample.id
      get "/posts/#{id}"
      expect(last_response).to be_ok
    end
  end

  describe "get new post" do
    it 'returns a success response' do
      get "/posts/new/form"
      expect(last_response).to be_ok
    end
  end

  describe "post create post" do
    it 'create a new post' do
      size = Post.all.size
      post "/posts", params={"title": "title", "content": "content", "rating": 0, "photo": "https://picsum.photos/id/1/600/600"}
      expect(Post.all.size).to eq(size+1)
      Post.all.last.delete
    end
  end
  describe "post create comment" do
    it 'create a new post' do
      size_all = Comment.all.size
      id = Post.all.last.id
      size_post = Comment.select(id).size
      post "/comments/#{id}", params={"content": "content"}
      expect(Comment.all.size).to eq(size_all+1)
      expect(Comment.select(id).size).to eq(size_post+1)
      Comment.all.last.delete
    end
  end

end