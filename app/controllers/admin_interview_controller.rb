class AdminInterviewController < ApplicationController

	def new
		@user = current_user
		@adminInterview = AdminInterview.new
		@teens = User.where(_type: "Teen").all
	end

	def create
		@adminInterview = AdminInterview.new interview_params
		@adminInterview.admin = current_user
		@adminInterview.save

		redirect_to root_url
		flash[:notice] = "Form Saved!"
	end

	def show
		@interview = AdminInterview.find(params[:id])
		@teen = User.find(@interview.teen_id)
	end

	private

	def interview_params
		params.require(:admin_interview).permit(
			:teen_id,
			:yourself,
  		:children,
  		:strength,
  		:weak,
  		:challenges,
  		:groups,
  		:talent,
  		:question,
  		:crying,
  		:tefillah,
  		:madrich,
  		:other
  	)


	end
end