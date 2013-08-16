class TeacherEndYearController < ApplicationController
	def new
		@user = current_user
		@teacherEY = TeacherEndYear.new
		@teens = User.where(_type: "Teen").all
	end

	def create
		@teacherEY = TeacherMidYear.new end_year_params
		@teacherEY.teacher = current_user
		@teacherEY.save

		redirect_to root_url
		flash[:notice] = "Form Saved!"
	end

	private

	def end_year_params
		params.require(:teacher_end_year).permit(
			:teen_id, 
			:placement,
			:aid,
			:initiative,
			:behave,
			:reliable,
			:srelation,
			:overall_performance,
			:grow,
			:other_teens,
			:request
		)
	end	
end
