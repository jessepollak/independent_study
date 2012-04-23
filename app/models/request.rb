class Request < ActiveRecord::Base
	validates_presence_of :title, :date
	validates_length_of :title, :maximum => 40
	validates_uniqueness_of :description, :scope => :title
	validates_with DateValidator

	belongs_to :user
	has_many :messages

	def self.search(search)
		query = "%" + search + "%"
    	@requests = Request.find(:all, :conditions => ['date >= ? AND (title LIKE ? OR description LIKE ?)', Time.now, query, query])
    	@requests.sort! { |a, b| a.date <=> b.date }
   end

   def self.sort()
   		@requests = Request.find(:all, :conditions => ['date >= ?', Time.now])
    	@requests.sort! { |a, b| a.date <=> b.date }
    end
   	
end
