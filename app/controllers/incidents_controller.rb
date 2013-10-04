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
		if is_teen?
			@nav = "shared/teen_nav"
		elsif is_teacher?
			@nav = "shared/teacher_nav"
		elsif is_admin?
			@nav = "shared/admin_nav"
		else
			redirect_to root_url
			flash[:notice] = "Invaild User Type"
		end
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
		if is_teen?
			@nav = "shared/teen_nav"
		elsif is_teacher?
			@nav = "shared/teacher_nav"
		elsif is_admin?
			@nav = "shared/admin_nav"
		else
			redirect_to root_url
			flash[:notice] = "Invaild User Type"
		end
	end

	def edit
		@user = current_user
		@incident = Incident.find(params[:id])
		@user1 = User.find(@incident.user_id)
		@teens = User.where(_type: "Teen").all
		@participants = User.find(@incident.participants)
	end

	def update
		@incident = Incident.find(params[:id])
		@incident.update_attributes(incident_params)
		redirect_to incidents_url
		flash[:notice] = "Incident Updated"
	end

	def destroy
		incident=Incident.find(params[:id])
		incident.destroy

		redirect_to incidents_url
		flash[:notice] = "Incident Deleted"
	end

	private

	def incident_params
		params.require(:incident).permit(
			{participants:[]},
			:report,
			:otherp)
		
	end
end