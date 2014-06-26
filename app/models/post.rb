class Post < ActiveRecord::Base
 #attr_accessor :title, :body

 validates :title, :body, :presence => true



end
