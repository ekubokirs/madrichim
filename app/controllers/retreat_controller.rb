class RetreatController < ApplicationController
	before_action	:navigation
	before_action	:is_authenticated?
	before_action	:set_timezone

	def index
		@retreat = Retreat.all
	end

	def new
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
end
