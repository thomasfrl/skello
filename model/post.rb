class Post
  attr_accessor :title, :content, :rating, :photo, :id

  def initialize(**args)
    self.title = args[:title]
    self.content = args[:content]
    self.rating = args[:rating]
    self.photo = args[:photo]
    self.id = args[:id]
  end
  
  def self.find(id)
    file = File.read('db/post.json')
    hash = JSON.parse(file)
    hash.each do |line|
      if  line["id"] == id
        return self.new(id: line["id"], title: line["title"], content: line["content"], rating: line["rating"], line: line["photo"])
      end
    end
  end

  def self.all
    file = File.read('db/post.json')
    hash = JSON.parse(file)
    posts = []
    hash.each do |line|
      post = self.new(id: line["id"], title: line["title"], content: line["content"], rating: line["rating"], line: line["photo"])
      posts << post
    end
    return posts
  end

  def comments
    Comment.select(self.id)
  end

  def save
    self.id = Post.all.last.id + 1
    json = JSON.parse(File.read('db/post.json'))
    json << {"id": self.id, "content": self.content, "rating": self.rating, "photo": self.photo, "title": self.title}
    File.write('db/post.json', json.to_json)
    return self
  end
end