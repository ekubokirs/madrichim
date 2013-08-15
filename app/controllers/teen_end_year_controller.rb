class TeenEndYearController < ApplicationController
def new
		@user = current_user
		@teen_end = TeenEndYear.new
	end

	def create
		@teen_end = TeenEndYear.new end_params
		@teen_end._id = current_user._id
		@teen_end.save

		redirect_to root_url
		flash[:notice] = "Application Saved!"
	end

	private

	def end_params
		params.require(:teen_end_year).permit(
			:size,
			:school,
			:grade,
			:change,
			:same,
			:grow,
			:days,
			:youth,
			:assign,
		)
	end

end