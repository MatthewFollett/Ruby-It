class Link < ActiveRecord::Base
  attr_accessible :url, :title
	
	belongs_to :user
	has_many :votes
	has_many :comments
	
	def score
		votes.where(:vote => 1).count - votes.where(:vote => -1).count
	end
end
