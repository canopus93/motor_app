class Garage < ApplicationRecord
	belongs_to :person
	belongs_to :motor
end
