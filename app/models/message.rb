class Message < ActiveRecord::Base
	validates_presence_of :name, :email, :message
	validates_uniqueness_of :message, :scope => :name
	validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
	validates_format_of :phone, :with => /^\(?([0-9]{3})\)?[-. ]?([0-9]{3})[-. ]?([0-9]{4})$/, :allow_blank => true

	belongs_to :request
end
