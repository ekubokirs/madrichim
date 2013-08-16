class TeenTermController < ApplicationController

def new
		@user = current_user
		@teen_term = TeenTerm.new
	end

	def create
		@teen_term = TeenTerm.new term_params
		@teen_term._id = current_user._id
		@teen_term.save

		redirect_to root_url
		flash[:notice] = "Application Saved!"
	end

	private

	def term_params
		params.require(:teen_term).permit(
			:leave,
			:change,
			:same,
			:grow,
			:learn,
			:life,
		)
	end
end