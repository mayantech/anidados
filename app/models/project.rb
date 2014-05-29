class Project < ActiveRecord::Base
	has_many :tasks
	accepts_nested_attributes_for :tasks, :reject_if => lambda { |a| a[:content].blank? }, :allow_destroy => true

	def task_for_form
		collection = tasks.where(task_id: id)
		collection.any? ? collection : tasks.build
	end
end
