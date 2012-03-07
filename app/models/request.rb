class Request < ActiveRecord::Base
	validates_presence_of :title, :date
	validates_uniqueness_of :description, :scope => :title
	validates_with DateValidator

	def self.search(search)
		query = "%" + search + "%"
    	find(:all, :conditions => ['title LIKE ? OR description LIKE ?', query, query])
   	end
end
