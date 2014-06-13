class AdminInterviewController < ApplicationController
before_action :is_authenticated
before_action	:set_timezone

	def index
		@interview = AdminInterview.all
		@user 		= current_user
	end

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

	def edit
		@user = current_user
		@interview = AdminInterview.find(params[:id])
		@teen = User.find(@interview.teen_id)
	end

	def update
		@interview = AdminInterview.find(params[:id])
		@interview.update_attributes(interview_params)
		redirect_to admin_interview_index_url
		flash[:notice] = "Interview Updated"
	end

	def destroy
		interview = AdminInterview.find(params[:id])
		interview.destroy

		redirect_to admin_interview_index_url
		flash[:notice] = "Interview Deleted"
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