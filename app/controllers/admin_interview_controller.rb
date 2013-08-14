class AdminInterviewController < ApplicationController

	def new
		@user = current_user
		@adminInterview = AdminInterview.new
	end

	def create
		@adminInterview = AdminInterview.new interview_params
		@adminInterview.save

		redirect_to root_url
		flash[:notice] = "Form Saved!"
	end

	private

	def interview_params
		params.require(:admin_interview).permit(
			:self,
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