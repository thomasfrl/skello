class Comment
  attr_accessor :content, :post_id

  def initialize(post_id, content)
    self.content = content
    self.post_id = post_id
  end
  
  def self.all
    file = File.read('db/comment.json')
    hash = JSON.parse(file)
    comments = []
    hash.each do |line|
      comment = self.new(line["content"], line["post_id"])
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
        comment = self.new(line["post_id"],line["content"])
        comments << comment
      end
    end
    return comments
  end

  def save
    json = JSON.parse(File.read('db/comment.json'))
    json << {"post_id": self.post_id, "content": self.content}
    File.write('db/comment.json', json.to_json)
  end
end