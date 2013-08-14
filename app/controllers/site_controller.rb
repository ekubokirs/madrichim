class SiteController < ApplicationController
	before_action :is_authenticated
	
	def index
		@user = current_user
		if is_teen?
			then @dashboard = "teen_dashboard"
		elsif is_teacher?
			 then @dashboard = "teacher_dashboard"
		elsif is_admin?
			then @dashboard = "admin_dashboard"
		else
			redirect_to login_url
			flash[:alert] = "You Lie!  Try Again!"
		end
	end
end
