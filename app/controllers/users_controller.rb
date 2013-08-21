class UsersController < ApplicationController
	before_action :is_authenticated
  before_action :is_admin?
	def index
		@user 		= User.all
		@teens 		= User.where(_type: "Teen").all
		@teachers = User.where(_type: "Teacher").all
		@admins 	= User.where(_type: "Admin").all
	end

	def edit
		@user = User.find(params[:id])

		if @teen = Teen.find(params[:id])
			@user_edit = "teen_edit"
		elsif @teacher = Teacher.find(params[:id])
			@user_edit = "teacher_edit"
		elsif @admin = Admin.find(params[:id])
			@user_edit = "admin_edit"
		else
			redirect_to root_url
			flash[:notice] = "Error"
		end
	end

	def update
		@teen = Teen.find(params[:id])
		@teacher = Teacher.find(params[:id])
		@admin = Admin.find(params[:id])
		if @teen
			@teen.update_attributes(teen_params)
			redirect_to root_url
			flash[:notice] = "Madrich/a Information Changed"
		elsif @teacher
			@teacher.update_attributes(teacher_params)
			redirect_to root_url
			flash[:notice] = "Teacher Information Changed"
		elsif @admin
			@admin.update_attributes(admin_params)
			redirect_to root_url
			flash[:notice] = "Admin Information Changed"
		else
			render :edit
		end	
	end

	def destroy
		@user = User.find(params[:id])
		@user.destroy

		redirect_to root_url
		flash[:notice] = "User Deleted"
	end

	private

	def admin_params
		params.require(:admin).permit(:first_name, :last_name, :email)
	end

	def teacher_params
		params.require(:teacher).permit(:first_name, :last_name, :email)
	end

	def teen_params
		params.require(:teen).permit(:first_name, :last_name, :email, :born_on, :home_phone, :cell_phone)
	end

end
