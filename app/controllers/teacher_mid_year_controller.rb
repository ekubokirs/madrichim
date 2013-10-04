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
		if is_teacher?
			@nav = "shared/teacher_nav"
		elsif is_admin?
			@nav = "shared/admin_nav"
		else
			redirect_to root_url
			flash[:notice] = "Incorrect User Type."
		end
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
		if is_teacher?
			@nav = "shared/teacher_nav"
		elsif is_admin?
			@nav = "shared/admin_nav"
		else
			redirect_to root_url
			flash[:notice] = "Incorrect User Type."
		end
	end

	def edit
		@teach_mid = TeacherMidYear.find(params[:id])
		@user = User.find(@teach_mid.user_id)
		@teen = User.find(@teach_mid.teen_id)
	end

	def update
		@teach_mid = TeacherMidYear.find(params[:id])
		@teach_mid.update_attributes(mid_year_params)
		redirect_to teacher_mid_year_index_url
		flash[:notice] = "Evaluation Updated"
	end

	def destroy
		teach_mid = TeacherMidYear.find(param[:id])
		teach_mid.destroy

		redirect_to teacher_mid_year_index_url
		flash[:notice] = "Evaluation Deleted"
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
