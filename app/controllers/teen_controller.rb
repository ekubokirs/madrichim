class TeenController < ApplicationController
  before_action :is_authenticated
 def index
 	@teens = User.where(_type: "Teen").all
 end

 def show
 	@user = current_user
 	@teens = User.where(_type: "Teen").all
 	
 	@teen = Teen.find(params[:id])

 	@form_new = TeenNew.where(teen_id: @teen.id).all
	@form_mid = TeenMidYear.where(teen_id: @teen.id).all
	@form_end = TeenEndYear.where(teen_id: @teen.id).all
	@form_term = TeenTerm.where(teen_id: @teen.id).all
	@app_retreat = Retreat.where(teen_id: @teen.id).all

	@form_teach_mid = TeacherMidYear.where(teen_id: @teen.id).all
	@form_teach_end = TeacherEndYear.where(teen_id: @teen.id).all

	
	@incident = Incident.where(participants: @teen.id.to_s).all

	# @incident = Incident.all.inject([]) do | array, incident |
	# 	if incident.participants.include?(@teen.id.to_s)
	# 		array << incident
	# 	end
	# 	array
	# end

	@incident_r = Incident.where(user_id: @teen.id).all

	@interview = AdminInterview.where(teen_id: @teen.id).all
 end 
end