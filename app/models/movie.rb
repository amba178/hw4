class Movie < ActiveRecord::Base

	scope :movies_same_dictor, lambda {|query| 
	       where(["director Like ?", "%#{query}%"])}


	def self.all_ratings
	%w(G PG PG-13 NC-17 R)
	end


end
