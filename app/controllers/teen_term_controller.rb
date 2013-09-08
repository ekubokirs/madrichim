class TeenTermController < ApplicationController
  before_action :is_authenticated
  def index
  	@teen_term = TeenTerm.all
  end

  def new
		@user = current_user
		@teen_term = TeenTerm.new
	end

	def create
		@teen_term = TeenTerm.new term_params
		@teen_term.teen_id = current_user.id
		@teen_term.save

		redirect_to root_url
		flash[:notice] = "Application Saved!"
	end

	def show
		@teen_term = TeenTerm.find(params[:id])
		@teen = User.find(@teen_term.teen_id)
	end

	private

	def term_params
		params.require(:teen_term).permit(
			:placement,
			:leave,
			:change,
			:same,
			:grow,
			:learn,
			:life,
		)
	end
end