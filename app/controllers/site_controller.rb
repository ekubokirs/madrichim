class SiteController < ApplicationController
	before_action :is_authenticated
	before_action	:set_timezone
	
	def index
		@user 		= current_user
		@teens  	= User.where(_type: "Teen").sort(:last_name.asc).all
		@teachers = User.where(_type: "Teacher").sort(:last_name.asc).all

		if is_teen?
			@dashboard 	= "teen_dashboard"
			@form_new		= TeenNew.where(teen_id: @user._id).all
			@form_mid		= TeenMidYear.where(teen_id: @user._id).all
			@form_end		= TeenEndYear.where(teen_id: @user._id).all
			@form_term	= TeenTerm.where(teen_id: @user._id).all
			@incident 	= Incident.where(user_id: @user.id).all
			@retreat		= Retreat.where(teen_id: @user.id).all
		elsif is_teacher?
			@dashboard 	= "teacher_dashboard"
			@form_mid		= TeacherMidYear.where(teacher_id: @user.id).all
			@form_end		= TeacherEndYear.where(teacher_id: @user.id).all
			@incident 	= Incident.where(user_id: @user.id).all
		elsif is_admin?
			@dashboard 	= "admin_dashboard"
		else
			redirect_to login_url
			flash[:alert] = "You Lie!  Try Again!"
		end
	end
end
