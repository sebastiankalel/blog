class Comment < ActiveRecord::Base 
	belongs_to :post

    def post
        Post.find(post_id)
    end 

end
