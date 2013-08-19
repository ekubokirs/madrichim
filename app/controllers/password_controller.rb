class PasswordController < ApplicationController
	def edit
		@user = User.find_by_code(params[:code])

		unless @user and @user.expires_at > Time.new
			redirect_to login_url
			flash[:alert] = "Reset link has expired.  Please try again."
		end
	end

	def update
		@user = User.find_by_code(params[:code])

		if @user and @user.expires_at >Time.now
			@user.update_attributes!(user_params)
			@user.code = nil
			@user.expires_at = nil
			@user.save

			if @user.save
				session[:user_id] = @user.id
				redirect_to root_url
				flash[:notice] = "Password Changed!"
			else
				redirect_to login_url
				flash[:alert] = "Reset link has expired.  Please try again."
			end
		else
			redirect_to login_url
			flash[:alert] = "Reset link has expired.  Please try again."
		end
	end

	private

	def user_params
		params.permit(
      :password,
      :password_confirmation,
      :code,
      :expires_at
    )
	end
end