class PeopleDecorator
	include Rails.application.routes.url_helpers
	include ActionView::Helpers::UrlHelper

	PeopleDecoratorResult = Struct.new(
		:id,
		:name,
		:money,
		:link_to_show,
		:link_to_edit,
		:link_to_delete
	)

	def initialize(context)
		@context = context
	end

	def decorate_for_index(people)
		results = []

		people.each do |person|
			results << generate_decorator_result(person: person)
		end
		results
	end

	def decorate_for_show(person)
		generate_decorator_result(person: person)
	end

	private
		def generate_decorator_result(person:)
			result = PeopleDecoratorResult.new
			result.id = person.id
			result.name = person.name
			result.money = person.money
			result.link_to_show = link_to_show(person)
			result.link_to_edit = link_to_edit(person)
			result.link_to_delete = link_to_delete(person)

			result
		end

		def link_to_show(person)
			@context.helpers.link_to person.name, person_path(person.id)
		end

		def link_to_edit(person)
			@context.helpers.link_to 'Edit', edit_person_path(person.id), class: 'btn btn-primary btn-xs'
		end

		def link_to_delete(person)
			@context.helpers.link_to 'Remove', person_path(person.id),
										method: :delete, 
										data: { confirm: "Are you sure to remove #{person.name}?"}, class: 'btn btn-primary btn-xs'
		end
end