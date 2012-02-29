require 'date'

class DateValidator < ActiveModel::Validator

	def validate(record)
		date = record.date
		begin
			if ((not (date.kind_of? DateTime)) or (date - DateTime.now > 365))
				record.errors.add(:date, "Invalid date")
			end
		end
	end
end