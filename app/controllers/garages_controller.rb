class GaragesController < ApplicationController
	def new
		@person = Person.find(params[:person_id])
		@garage = Garage.new(person: @person)
	end

	def create
		person = Person.find(params[:person_id])
		@garage = person.garages.create(motor_id: params[:garage]["motor"])

		if @garage.save
			redirect_to person_path(params[:person_id])
		else
			render 'new'
		end
	end

	def destroy
		person = Person.find(params[:person_id])
		@garage = person.garages.find(params[:id])
		@garage.destroy

		redirect_to person_path(params[:person_id])
	end
end
