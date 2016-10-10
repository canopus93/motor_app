class MotorsController < ApplicationController
	def index
		decorator = MotorsDecorator.new(self)
		@motors = decorator.decorate_for_index(Motor.all)
	end

	def show
		decorator = MotorsDecorator.new(self)
		@motor = decorator.decorate_for_show(Motor.find(params[:id]))
	end

	def new
		@motor = Motor.new
	end

	def edit
		@motor = Motor.find(params[:id])
	end

	def create
		@motor = Motor.new(motor_params)

		if @motor.save
			redirect_to @motor
		else
			render 'new'
		end
	end

	def update
		@motor = Motor.find(params[:id])

		if @motor.update(motor_params)
			redirect_to @motor
		else
			render 'edit'
		end
	end

	def destroy
		@motor = Motor.find(params[:id])
		@motor.destroy

		redirect_to motors_path
	end

	private
		def motor_params
			params.require(:motor).permit(:name, :velocity, :current_fuel, :max_fuel)
		end
end
