class TeenMidYearController < ApplicationController
  before_action :is_authenticated
	def index
		@teenMY = TeenMidYear.all
		@user 		= current_user
	end

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
		if is_teen?
			@nav = "shared/teen_nav"
		elsif is_admin?
			@nav = "shared/admin_nav"
		else
			redirect_to root_url
			flash[:notice] = "Invalid User Type"
		end
	end

	def edit
		@teen_mid = TeenMidYear.find(params[:id])
		@teen = Teen.find(@teen_mid.teen_id)
	end

	def update
		@teen_mid = TeenMidYear.find(params[:id])
		@teen_mid.update_attributes(mid_year_params)

		redirect_to teen_mid_year_index_url
		flash[:notice] = "Evaluation Updated"
	end

	def destroy
		teen_mid = TeenMidYear.find(params[:id])
		teen_mid.destroy

		redirect_to teen_mid_year_index_url
		flash[:notice] ="Evaluation Deleted"
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
