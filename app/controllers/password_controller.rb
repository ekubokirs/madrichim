class PasswordController < ApplicationController
	after_action	:clear_expired_codes
	before_action	:set_timezone

	def edit
		@user = User.find_by_code(params[:code])

		unless @user and @user.expires_at > Time.new
			redirect_to login_url
			flash[:alert] = "Reset link has expired.  Please try again."
		end
	end

	def update
    if @user.update_attributes(user_params)
      session[:user_id] = @user.id
      redirect_to root_url 
      flash[:notice] = "Your password has been changed."
    else
      flash[:alert] = "Password reset failed."
      render new
    end
  end

	private

	def clear_expired_codes
		User.where(:expires_at.lt => Time.now)
		.update(code: nil, expires_at: nil)
	end

	def user_params
		params.permit(
      :password,
      :password_confirmation,
      :code,
      :expires_at
    )
	end
end