class Person < ApplicationRecord
	has_many :garages, dependent: :destroy
	has_many :motors, through: :garages
	validates :name, presence: true
	validates :money, presence: true,
										numericality: { greater_than_or_equal_to: 0 }

end
