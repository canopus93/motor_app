class Motor < ApplicationRecord
	validates :name, presence: true
	validates :velocity, presence: true,
										numericality: { greater_than: 0 }
	validates :current_fuel, presence: true,
										numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: :max_fuel }
	validates :max_fuel, presence: true,
										numericality: { greater_than: 0 }
end
