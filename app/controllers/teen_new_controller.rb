class TeenNewController < ApplicationController
  before_action :is_authenticated
	def index
		@teen_new = TeenNew.all
		@user 		= current_user
	end

	def new
		@user = current_user
		@teen_new = TeenNew.new
	end

	def create
		@teen_new = TeenNew.new new_params
		@teen_new.teen = current_user
		@teen_new.save

		redirect_to root_url
		flash[:notice] = "Application Saved!"
	end

	def show
		@teen_new = TeenNew.find(params[:id])
		@teen = Teen.find(@teen_new.teen_id)
		puts "*"*50
		puts @teen
	end
	
	def edit
		@teen_new = TeenNew.find(params[:id])
		@teen = Teen.find(@teen_new.teen_id)
	end

	def update
		@teen_new = TeenNew.find(params[:id])
		@teen_new.update_attributes(new_params)

		redirect_to teen_new_index_url
		flash[:notice] = "Application Updated"
	end

	def destroy
		teen_new = TeenNew.find(params[:id])
		teen_new.destroy

		redirect_to teen_new_index_url
		flash[:notice] = "Application Deleted"
	end

	private

	def new_params
		params.require(:teen_new).permit(
			:size,
			:school,
			:grade,
			:join,
			:goal,
			:jact,
			:act,
			{days:[]},
			:youth,
			{assign:[]},
			:request,
			:desc
		)
	end
end