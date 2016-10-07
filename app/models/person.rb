class Person < ApplicationRecord
	validates :name, presence: true
	validates :money, presence: true,
										numericality: { greater_than_or_equal_to: 0 }

end
