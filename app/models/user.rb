class User < ActiveRecord::Base
	
	validates :email, presence: true, email: true
	#validates :number, length: { is: 10, wrong_length: "#{number} is not a valid phone number"}

	

	def self.new_user_from_hash(hash)
		@user = User.new fb_id: hash[:uid],
			name: hash[:info][:name],
			email: hash[:info][:email]
	end

	def self.find_from_hash(hash)
		User.find_by_fb_id(hash[:uid])
	end
end
