class TeenNewController < ApplicationController
	def new
		@user = current_user
		@teen_new = TeenNew.new
	end

	def create
		@teen_new = TeenNew.new new_params
		@teen_new._id = current_user._id
		@teen_new.save

		redirect_to root_url
		flash[:notice] = "Application Saved!"
	end

	private

	def new_params
		puts "*"*50
		puts params[:teen_new]
		params.require(:teen_new).permit(
			:size,
			:school,
			:grade,
			:join,
			:goal,
			:jact,
			:act,
			:days,
			:youth,
			:assign,

		)
	end
end