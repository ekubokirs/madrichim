class PasswordController < ApplicationController
	before_action :get_user
	after_action	:clear_expired_codes

	def edit
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

	def get_user
		@user = User.find_by_code(params[:code])

		unless @user and @user.expires_at > Time.new
			redirect_to login_url
			flash[:alert] = "Reset link has expired.  Please try again."
		end
	end

	def clear_expired_codes
		User.where(:expires_at.lt => Time.now)
		.update(code: nil, expires_at: nil)
	end

	def user_params
		params.require(:user).permit(
      :password,
      :password_confirmation
    )
	end
end