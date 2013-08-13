class TeacherMidYearController < ApplicationController
	def new
		@user = current_user
		@teacherMY = TeacherMidYear.new
	end

	def create
		@teacherMY = TeacherMidYear.new mid_year_params
		@teacherMY._id = current_user._id
		@teacherMY.save

		redirect_to root_url
		flash[:notice] = "Form Saved!"
	end

	private

	def mid_year_params
		params.require(:teacher_mid_year).permit(
			:placement,
			:aid,
			:initiative,
			:reliable,
			:srelation,
			:overall_performance,
			:other_teens,
		)
	end	
end
