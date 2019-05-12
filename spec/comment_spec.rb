require_relative './spec_helper.rb'
require 'controller'

RSpec.describe Comment  do
  describe "#all" do
    it 'select all comment' do
      comments = Comment.all
      comments.each do |comment|
        expect(comment.class).to eq(Comment)
      end
    end
  end
  describe "#select" do
    it 'select the comments of the post' do
      comments = Comment.select(2)
      comments.each do |comment|
        expect(comment.class).to eq(Comment)
        expect(comment.post_id).to eq(2)
      end
    end
  end

  describe "#save" do
    it 'save the comment' do
      last_id = Comment.all.last.id
      comment = Comment.new(content: "content",post_id: 2)
      comment.save 
      last_comment = Comment.all.last
      expect(last_comment.content).to eq(comment.content)
      expect(last_comment.id).to eq(last_id+1)
      last_comment.delete
    end
  end

  describe "#delete" do
    it 'delete the comment' do
      last_id = Comment.all.last.id
      comment = Comment.new(title: "title", content: "content",rating: "rating",photo: "photo")
      comment.save 
      comment.delete
      expect(last_id).to eq(Comment.all.last.id)
    end
  end
end