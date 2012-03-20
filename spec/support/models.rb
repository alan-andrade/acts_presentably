class Post < ActiveRecord::Base
  belongs_to :author
  acts_presentably
end

class Author < ActiveRecord::Base
  has_many :posts
  acts_presentably
end