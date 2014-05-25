class TeenTermController < ApplicationController
  before_action :is_authenticated
  before_action	:navigation
  before_action	:set_timezone

  def index
  	@teen_term = TeenTerm.all
  	@user 		= current_user
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

	def edit
		@teen_term = TeenTerm.find(params[:id])
		@teen = User.find(@teen_term.teen_id)
	end

	def update
		@teen_term = TeenTerm.find(params[:id])
		@teen_term.update_attributes(term_params)

		redirect_to teen_term_index_url
		flash[:notice] = "Form Updated"
	end

	def destroy
		teen_term = TeenTerm.find(params[:id])
		teen_term.destroy

		redirect_to teen_term_index_url
		flash[:notice] = "Form Deleted"
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