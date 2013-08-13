class SiteController < ApplicationController
	before_action :is_authenticated
	
	def index
		@user = current_user
		@dashboard = if is_teen?
			then "teen_dashboard"
		elsif is_teacher?
			 then "teacher_dashboard"
		elsif is_admin?
			then "admin_dashboard"
		else
			redirect_to login_url
			flash[:alert] = "You Lie!  Try Again!"
		end
	end

end
