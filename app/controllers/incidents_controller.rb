class IncidentsController <ApplicationController
  before_action :is_authenticated
	
	def index
		@incidents = Incident.all
		@user 		= current_user
	end

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

	def show
		@incident = Incident.find(params[:id])
		@user = User.find(@incident.user_id)
	end

	private

	def incident_params
		params.require(:incident).permit(
			{participants:[]},
			:report,
			:otherp)
		
	end
end