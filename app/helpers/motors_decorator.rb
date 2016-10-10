class MotorsDecorator
	include Rails.application.routes.url_helpers
	include ActionView::Helpers::UrlHelper

	MotorsDecoratorResult = Struct.new(
		:id,
		:name,
		:velocity,
		:current_fuel,
		:max_fuel,
		:link_to_show,
		:link_to_edit,
		:link_to_delete
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
			result.velocity = "#{motor.velocity} m/s"
			result.current_fuel = "#{motor.current_fuel}/#{motor.max_fuel} litre"
			result.max_fuel = motor.max_fuel
			result.link_to_show = link_to_show(motor)
			result.link_to_edit = link_to_edit(motor)
			result.link_to_delete = link_to_delete(motor)

			result
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