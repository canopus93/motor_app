class MotorsController < ApplicationController
	def index
		decorator = MotorsDecorator.new(self)
		@decorated_motors = decorator.decorate_for_index(Motor.order(id: :ASC))
	end

	def show
		decorator = MotorsDecorator.new(self)
		@decorated_motor = decorator.decorate_for_show(Motor.find(params[:id]))
	end

	def new
		@motor = Motor.new
	end

	def edit
		@motor = Motor.find(params[:id])
	end

	def refill_fuel
		@motor = Motor.find(params[:id])
	end

	def ride
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

	def update_ride
		@motor = Motor.find(params[:id])
		old_current_fuel = @motor.current_fuel
		old_distance_travelled = @motor.distance_travelled
		old_time_travelled = @motor.time_travelled

		time = BigDecimal.new(params[:ride_time])
		distance = @motor.velocity * time
		fuel_used = distance / 100
		if fuel_used >= @motor.current_fuel
			fuel_used = @motor.current_fuel
			@motor.current_fuel = 0
			distance = fuel_used * 100
			time = distance / @motor.velocity
		else
			@motor.current_fuel -= fuel_used
		end
		@motor.distance_travelled += distance
		@motor.time_travelled += time

		if @motor.update(current_fuel: @motor.current_fuel, distance_travelled: @motor.distance_travelled, time_travelled: @motor.distance_travelled)
			redirect_to @motor
		else
			@motor.current_fuel = old_current_fuel
			@motor.distance_travelled = old_distance_travelled
			@motor.time_travelled = old_time_travelled
			render 'ride'
		end
	end

	def update_fuel
		@motor = Motor.find(params[:id])
		old_current_fuel = @motor.current_fuel
		@motor.current_fuel += BigDecimal.new(params[:refill_amount])

		if @motor.update(current_fuel: @motor.current_fuel)
			redirect_to @motor
		else
			@motor.current_fuel = old_current_fuel
			render 'refill_fuel'
		end
	end

	def reset
		@motor = Motor.find(params[:id])
		@motor.update(current_fuel: 0, distance_travelled: 0, time_travelled: 0)
		redirect_to @motor
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
