class Article < ActiveRecord::Base
  validates :title, :body, presence: true
  before_save :save_read_time
  before_create :save_read_time

  private
    def save_read_time
      # define stopwords, find all words then find keyboards 
      stopwords = %w{the a by on for of are with just but and to my I has some in}
      words = self.body.split
      keywords = words.select { |word| !stopwords.include?(word) }
      keyword_count = keywords.length
      # assume a reading speed of 250 words per minute    
      self.read_time = (keyword_count.to_f/250).round
  end
end
