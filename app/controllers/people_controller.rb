class PeopleController < ApplicationController
	def index
		decorator = PeopleDecorator.new(self)
		@decorated_people = decorator.decorate_for_index(Person.order(id: :ASC))
	end

	def show
		decorator = PeopleDecorator.new(self)
		@decorated_person = decorator.decorate_for_show(Person.find(params[:id]))
	end

	def new
		@person = Person.new
	end

	def edit
		@person = Person.find(params[:id])
	end

	def create
		@person = Person.new(person_params)

		if @person.save
			flash[:success] = "Success add new person!"
			redirect_to @person
		else
			render 'new'
		end
	end

	def update
		@person = Person.find(params[:id])

		if @person.update(person_params)
			flash[:success] = "Success update person data!"
			redirect_to @person
		else
			render 'edit'
		end
	end

	def destroy
		@person = Person.find(params[:id])
		@person.destroy

		flash[:success] = "Success remove person!"
		redirect_to people_path
	end

	private
		def person_params
			params.require(:person).permit(:name, :money)
		end
end
