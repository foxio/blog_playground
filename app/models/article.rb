class Article < ActiveRecord::Base
  validates :title, :body, presence: true
  before_save :save_read_time
  before_create :save_read_time
    
  has_many :taggings
  has_many :tags, through: :taggings

  def tag_list
    self.tags.collect do |tag|
      tag.name
    end.join(", ")
  end
    
  def tag_list=(tags_string)
    tag_names = tags_string.split(",").collect{|s| s.strip.downcase}.uniq
    new_or_found_tags = tag_names.collect { |name| Tag.find_or_create_by(name: name) }
    self.tags = new_or_found_tags
  end    
    
  private
    
    
    def save_read_time
      # define stopwords, find all words then find keyboards 
      stopwords = %w{the a by on for of are with just but and to my I has some in}
      words = self.body.split
      keywords = words.select { |word| !stopwords.include?(word) }
      keyword_count = keywords.length
      # assume a reading speed of 250 words per minute and calculate read_time in seconds    
      self.read_time = ((keyword_count.to_f/250)*60).round
  end
end
