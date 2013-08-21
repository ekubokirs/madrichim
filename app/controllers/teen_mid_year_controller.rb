class TeenMidYearController < ApplicationController
  before_action :is_authenticated
	def new
		@user = current_user
		@teenMidYear = TeenMidYear.new
	end

	def create
		@teenMY = TeenMidYear.new mid_year_params
		@teenMY.teen_id= current_user._id
		@teenMY.save

		redirect_to root_url
		flash[:notice] = "Form Saved!"
	end

	def show
		@teen_mid = TeenMidYear.find(params[:id])
		@teen = Teen.find(@teen_mid.teen_id)
	end

	private

	def mid_year_params
		params.require(:teen_mid_year).permit(
			:placement,
			:aid,
			:initiative,
			:behave,
			:reliable,
			:srelation,
			:overall_performance,
			:other_teens,
		)
	end
end
