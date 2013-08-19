class TeenEndYearController < ApplicationController
	def new
		@user = current_user
		@teen_end = TeenEndYear.new
	end

	def create
		@teen_end = TeenEndYear.new end_params
		@teen_end.teen_id = current_user._id
		@teen_end.save

		redirect_to root_url
		flash[:notice] = "Application Saved!"
	end

	def show
		@teen_end = TeenEndYear.find(params[:id])
		@teen = Teen.find(@teen_end.teen_id)
	end

	private

	def end_params
		params.require(:teen_end_year).permit(
			:placement,
			:size,
			:school,
			:grade,
			:change,
			:same,
			:grow,
			{days:[]},
			:youth,
			{assign:[]},
			:request,
			:desc
		)
	end

end