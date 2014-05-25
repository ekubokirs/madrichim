class TeacherController < ApplicationController
  before_action :is_authenticated
  before_action	:set_timezone

	def index
		@teacher = User.where(_type: "Teacher").all
	end
end