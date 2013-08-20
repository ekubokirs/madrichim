class TeacherController < ApplicationController
	def index
		@teacher = User.where(_type: "Teacher").all
	end
end