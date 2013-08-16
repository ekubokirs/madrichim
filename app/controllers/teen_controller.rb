class TeenController < ApplicationController
 def index
 	@teens = User.where(_type: "Teen").all
 end

 def show
 	@teens = User.where(_type: "Teen").all
 	
 	@teen = Teen.find(params[:id])

 	@form_new = TeenNew.where(teen_id: @teen.id).all
	@form_mid = TeenMidYear.where(teen_id: @teen.id).all
	@form_end = TeenEndYear.where(teen_id: @teen.id).all
	@form_term = TeenTerm.where(teen_id: @teen_id).all
	puts "*"*50
	puts @teen_id

	@form_teach_mid = TeacherMidYear.where(teen_id: @teen.id).all
	@form_teach_end = TeacherEndYear.where(teen_id: @teen.id).all

	@incident = Incident.where(parcipants: @teen_id).all
	@incident_r = Incident.where(user_id: @teen_id).all

	@interview = AdminInterview.where(teen_id: @teen_id).all
	puts "*"*50
	puts @teen_id
	puts @interview
 end 
end