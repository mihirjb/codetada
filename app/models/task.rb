class Task < ActiveRecord::Base
  attr_accessible :content, :title, :user_id
  
  validates :content, :presence => true, :length => {:within => 1..140}
  
  belongs_to :user
end
