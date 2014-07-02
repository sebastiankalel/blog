class Post < ActiveRecord::Base
has_many :comments

 #attr_accessor :title, :body

validates :title, :body, :presence => true

def comments
      Comment.where("post_id=#{id}")
end

def ultimo
     comments.last
end


end
