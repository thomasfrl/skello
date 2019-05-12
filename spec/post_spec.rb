require_relative './spec_helper.rb'
require 'controller'

RSpec.describe Post  do
  describe "#all" do
    it 'select all post' do
      posts = Post.all
      posts.each do |post|
        expect(post.class).to eq(Post)
      end
    end
  end
  describe "#find" do
    it 'select one post' do
      post = Post.find(2) 
      expect(post.class).to eq(Post)
      expect(post.id).to eq(2)
    end
  end
  describe "#comments" do
    it 'select the comments of the post' do
      post = Post.find(2)
      comments = post.comments 
      comments.each do |comment|
        expect(comment.class).to eq(Comment)
        expect(comment.post_id).to eq(post.id)
      end
    end
  end

  describe "#save" do
    it 'save the post' do
      last_id = Post.all.last.id
      post = Post.new(title: "title", content: "content",rating: "rating",photo: "photo3")
      post.save 
      last_post = Post.all.last
      expect(last_post.content).to eq(post.content)
      expect(last_post.id).to eq(post.id)
      expect(last_post.id).to eq(last_id+1)
      post.delete
    end
  end

  describe "#delete" do
    it 'delete the post' do
      last_id = Post.all.last.id
      post = Post.new(title: "title", content: "content",rating: "rating",photo: "photo")
      post.save 
      post.delete
      expect(last_id).to eq(Post.all.last.id)
    end
  end
end