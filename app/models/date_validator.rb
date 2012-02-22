class DateValidator < ActiveModel::Validator

	def validate(record)
		date = record.date
		begin
			date = DateTime.parse(date)
			if (date.second - Time.now.sec > 1.year.sec)
				raise ArgumentError
			end
		rescue ArgumentError
			errors.add(:date, "Invalid date")
		end
	end
end