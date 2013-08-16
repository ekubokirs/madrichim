class TeenController < ApplicationController
 def index
 	@teens = User.where(_type: "Teen").all
 end

 def show
 	@teens = User.where(_type: "Teen").all
 	@teen = User.find(params[:id])

 	@form_new = TeenNew.where(teen_id: @teen.id).all
	@form_mid = TeenMidYear.where(teen_id: @teen.id).all
	@form_end = TeenEndYear.where(teen_id: @teen.id).all
	# @form_term = TeenTerm.where(teen_id: @user_id).all

	@form_teach_mid =
	@form_teach_end = TeacherEndYear.where(teen)
 end 
end