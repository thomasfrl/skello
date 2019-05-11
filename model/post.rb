class Post
  attr_accessor :title, :content, :rating, :photo, :id

  def initialize(id, title, content, rating, photo)
    self.title = title
    self.content = content
    self.rating = rating
    self.photo = photo
    self.id = id
  end
  
  def self.find(id)
    file = File.read('db/post.json')
    hash = JSON.parse(file)
    hash.each do |line|
      if  line["id"] == id
        return self.new(line["id"], line["title"], line["content"], line["rating"], line["photo"])
      end
    end
  end

  def self.all
    file = File.read('db/post.json')
    hash = JSON.parse(file)
    posts = []
    hash.each do |line|
      post = self.new(line["id"], line["title"], line["content"], line["rating"], line["photo"])
      posts << post
    end
    return posts
  end

  def comments
    Comment.select(self.id)
  end
end