require 'date'

class DateValidator < ActiveModel::Validator

	def validate(record)
		date = record.date.to_datetime
		if ((not(date.kind_of? DateTime)) or ((date - DateTime.now) > 365.25) or ((date - DateTime.now) <= 0))
			record.errors.add(:date, "Invalid date")
		end
	end
end