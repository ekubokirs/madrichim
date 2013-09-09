class TeacherMidYearController < ApplicationController
  before_action :is_authenticated
	def index
		@teacherMY= TeacherMidYear.all
		@user 		= current_user
	end

	def new
		@user = current_user
		@teacherMY = TeacherMidYear.new
		@teens = User.where(_type: "Teen").all
	end

	def create
		@teacherMY = TeacherMidYear.new mid_year_params
		@teacherMY.user = current_user
		@teacherMY.save

		redirect_to root_url
		flash[:notice] = "Form Saved!"
	end

	def show
		@teach_mid = TeacherMidYear.find(params[:id])
		@teen = User.find(@teach_mid.teen_id)
	end


	private

	def mid_year_params
		params.require(:teacher_mid_year).permit(
			:teen_id, 
			:placement,
			:aid,
			:initiative,
			:behave,
			:reliable,
			:srelation,
			:overall_performance,
			:other_teens,
		)
	end	
end
