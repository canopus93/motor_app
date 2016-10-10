class MotorsDecorator
	include Rails.application.routes.url_helpers
	include ActionView::Helpers::UrlHelper

	MotorsDecoratorResult = Struct.new(
		:id,
		:name,
		:velocity,
		:show_velocity,
		:current_fuel,
		:show_current_fuel,
		:max_fuel,
		:distance_travelled,
		:show_distance_travelled,
		:time_travelled,
		:show_time_travelled,
		:link_to_show,
		:link_to_edit,
		:link_to_delete,
		:link_to_refill,
		:link_to_ride,
		:link_to_reset,
		:able_to_refill,
		:able_to_ride
	)

	def initialize(context)
		@context = context
	end

	def decorate_for_index(motors)
		results = []

		motors.each do |motor|
			results << generate_decorator_result(motor: motor)
		end
		results
	end

	def decorate_for_show(motor)
		generate_decorator_result(motor: motor)
	end

	private
		def generate_decorator_result(motor:)
			result = MotorsDecoratorResult.new
			result.id = motor.id
			result.name = motor.name
			result.velocity = motor.velocity
			result.show_velocity = "#{motor.velocity} m/s"
			result.current_fuel = motor.current_fuel
			result.show_current_fuel = "#{motor.current_fuel}/#{motor.max_fuel} litre"
			result.max_fuel = motor.max_fuel
			result.distance_travelled = motor.distance_travelled
			result.show_distance_travelled = "#{motor.distance_travelled} m"
			result.time_travelled = motor.time_travelled
			result.show_time_travelled = "#{motor.time_travelled} s"
			result.link_to_show = link_to_show(motor)
			result.link_to_edit = link_to_edit(motor)
			result.link_to_delete = link_to_delete(motor)
			result.link_to_refill = link_to_refill(motor)
			result.able_to_refill = able_to_refill?(motor)
			result.link_to_ride = link_to_ride(motor)
			result.able_to_ride = able_to_ride?(motor)
			result.link_to_reset = link_to_reset(motor)

			result
		end

		def able_to_refill?(motor)
			motor.max_fuel != motor.current_fuel
		end

		def link_to_refill(motor)
			@context.helpers.link_to 'Refill', refill_motor_path(motor.id), class: 'btn btn-primary btn-xs'
		end

		def able_to_ride?(motor)
			motor.current_fuel > 0
		end

		def link_to_ride(motor)
			@context.helpers.link_to 'Ride', ride_motor_path(motor.id), class: 'btn btn-primary btn-xs'
		end

		def link_to_reset(motor)
			@context.helpers.link_to 'Reset', reset_motor_path(motor.id),
										method: :patch, 
										data: { confirm: "Are you sure to reset #{motor.name}?"}, class: 'btn btn-primary btn-xs'
		end

		def link_to_show(motor)
			@context.helpers.link_to motor.name, motor_path(motor.id)
		end

		def link_to_edit(motor)
			@context.helpers.link_to 'Edit', edit_motor_path(motor.id), class: 'btn btn-primary btn-xs'
		end

		def link_to_delete(motor)
			@context.helpers.link_to 'Remove', motor_path(motor.id),
										method: :delete, 
										data: { confirm: "Are you sure to remove #{motor.name}?"}, class: 'btn btn-primary btn-xs'
		end
end