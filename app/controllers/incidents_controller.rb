class IncidentsController <ApplicationController
	def new
		@user = current_user
		@incident = Incident.new
		@teens = User.where(_type: "Teen").all
	end

	def create
		@incident = Incident.new incident_params
		@incident.user = current_user
		@incident.save

		redirect_to root_url
		flash[:notice] = "Incident Logged"
	end

	private

	def incident_params
		params.require(:incident).permit(
			{participants:[]},
			:report)
		
	end
end