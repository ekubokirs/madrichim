class TeenEndYearController < ApplicationController
  before_action :is_authenticated
	def index
		@teen_end = TeenEndYear.all
		@user 		= current_user
	end

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
		@teen_end = TeenEndYear.find(params[:id])
		@teen = Teen.find(@teen_end.teen_id)
	end

	def update
		@teen_end = TeenEndYear.find(params[:id])
		@teen_end.update_attributes(end_params)

		redirect_to teen_end_year_index_url
		flash[:notice] = "Evaluation Updated"
	end

	def destroy
		teen_end = TeenEndYear.find(params[:id])
		teen_end.destroy

		redirect_to teen_end_year_index_url
		flash[:notice] ="Evaluation Deleted"
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