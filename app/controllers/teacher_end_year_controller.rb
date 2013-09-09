class TeacherEndYearController < ApplicationController
  before_action :is_authenticated
	def index
		@teachEY = TeacherEndYear.all
		@user 		= current_user
	end

	def new
		@user = current_user
		@teacherEY = TeacherEndYear.new
		@teens = User.where(_type: "Teen").all
	end

	def create
		@teacherEY = TeacherEndYear.new end_year_params
		@teacherEY.user = current_user
		@teacherEY.save

		redirect_to root_url
		flash[:notice] = "Form Saved!"
	end

	def show
		@teach_end = TeacherEndYear.find(params[:id])
		@teen = User.find(@teach_end.teen_id)
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
