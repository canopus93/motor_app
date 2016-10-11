module MotorsHelper
	def is_number? text
	  true if Float(text) rescue false
	end
end
