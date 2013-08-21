class TeacherController < ApplicationController
  before_action :is_authenticated
	def index
		@teacher = User.where(_type: "Teacher").all
	end
end