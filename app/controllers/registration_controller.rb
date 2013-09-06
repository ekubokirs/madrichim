class RegistrationController < ApplicationController

	after_action :clear_expired_registrants
	before_action :get_registrant

	def new
		@teen = Teen.new(email: @registrant.email)
		@teacher = Teacher.new(email: @registrant.email)
	end

	def create
		if params[:teen]
			@user = Teen.new(teen_params)
			puts "==="*30
			puts params[:teen][:home_phone]
			puts params[:teen][:cell_phone]
		elsif params[:teacher]
			@user = Teacher.new(teacher_params)
		else
			redirect_to login_url
			flash[:alert] = "You must be a Teacher or a Madrich/a!"
		end
		
		@user.email = @registrant.email

		if @user.save!
			@registrant.destroy
			session[:user_id] = @user._id
			redirect_to root_url
			flash[:notice] = "You've Logged In!"
		else
			render :new
		end
	end

	private

	def clear_expired_registrants
		Registrant.destroy_all(:expires_at.lt => Time.now)
	end

	def get_registrant
		@registrant = Registrant.find_by_code params[:code]
		unless @registrant
			Registrant.where(:expires_at.lt => Time.now)
			redirect_to login_url
			flash[:alert] = "Registration Link Expired"
		end
	end

	def teen_params
		params.require(:teen).permit(
			:first_name,
  		:last_name,
  		:email,
			:born_on,
		  :home_phone,
		  :cell_phone,
		  :password,
		  :password_confirmation
		)
	end

	def teacher_params
		params.require(:teacher).permit(
		:first_name,
	  :last_name,
	  :email,
	  :password,
		:password_confirmation
		)
	end
end
