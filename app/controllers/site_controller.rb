class SiteController < ApplicationController
	before_action :is_authenticated
	
	def index
		@user = current_user
		@dashboard = if @user._type = "Teen"
			"teen_dashboard"
		elsif @user._type = "Teacher"
			"teacher_dashboard"
		elsif @user._type = "Admin"
			"admin_dashboard"
		else
			redirect_to login_url
			flash[:alert] = "You Lie!  Try Again!"
		end
	end

end
