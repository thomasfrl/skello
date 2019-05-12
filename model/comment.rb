class Comment
  attr_accessor :content, :post_id, :id

  def initialize(**args)
    self.content = args[:content]
    self.post_id = args[:post_id]
    self.id = args[:id]
  end
  
  def self.all
    file = File.read('db/comment.json')
    hash = JSON.parse(file)
    comments = []
    hash.each do |line|
      comment = self.new(content: line["content"], post_id: line["post_id"], id: line["id"])
      comments << comment
    end
    return comments
  end

  def self.select(post_id)
    file = File.read('db/comment.json')
    hash = JSON.parse(file)
    comments = []
    hash.each do |line|
      if line["post_id"] == post_id
        comment = self.new(content: line["content"], post_id: line["post_id"], id: line["id"])
        comments << comment
      end
    end
    return comments
  end

  def save
    self.id = Comment.all.last.id + 1
    json = JSON.parse(File.read('db/comment.json'))
    json << {"post_id": self.post_id, "content": self.content, "id": self.id}
    File.write('db/comment.json', json.to_json)
  end

  def delete
    id = self.id
    json = JSON.parse(File.read('db/comment.json'))
    new_json = json.reject{|comment| comment["id"] == id}
    File.write('db/comment.json', new_json.to_json)
  end

end