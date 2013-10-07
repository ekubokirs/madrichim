class RetreatController < ApplicationController
	def index
		@retreat = Retreat.all
	end

	def new
		if current_user = is_teen?
			@nav = "shared/teen_nav"
		elsif current_user = is_admin?
			@nav = "shared/admin_nav"
		else
			redirect_to root_url
			flash[:notice] = "Error.  Must Be Madrich/a or Admin"
		end
				
		@user = current_user
		@retreat = Retreat.new
	end

	def create
		@retreat = Retreat.new retreat_params
		@retreat.teen_id = current_user._id
		@retreat.save

		redirect_to root_url
		flash[:notice] = "Application Saved!"
	end

	def show
		if current_user = is_teen?
			@nav = "shared/teen_nav"
		elsif current_user = is_admin?
			@nav = "shared/admin_nav"
		else
			redirect_to root_url
			flash[:notice] = "Error.  Must Be Madrich/a or Admin"
		end
		@retreat = Retreat.find(params[:id])
		@teen = Teen.find(@retreat.teen_id)
	end

	private

	def retreat_params
		params.require(:retreat).permit(
			:want,
			:bedtime,
			:early,
			:better,
			:homesickness,
			:afraid,
			:concern
			)
	end

	def full_name
    first_name + " " + last_name
  end
end
