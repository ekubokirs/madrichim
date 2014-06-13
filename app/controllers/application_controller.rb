class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :is_teen?
  helper_method :is_teacher?
  helper_method :is_admin?
  helper_method :navigation
  helper_method :set_timezone
  helper_method :full_name

  def current_user
  	@current_user = User.find_by_id session[:user_id]
  end

  def is_authenticated
  	redirect_to login_url unless current_user
  end

   def is_teen?
  	current_user && @current_user.kind_of?(Teen)
  end

  def is_teacher?
  	current_user && @current_user.kind_of?(Teacher)
  end

  def is_admin?
  	current_user && @current_user.kind_of?(Admin)
  end

  def navigation
    if is_teen?
      @nav = "shared/teen_nav"
    elsif is_teacher?
      @nav = "shared/teacher_nav"
    elsif is_admin?
      @nav = "shared/admin_nav"
    else
      redirect_to root_url
      flash[:notice] = "Invalid User Type"
    end
  end

  def set_timezone
    Time.zone = "Pacific Time (US & Canada)"
  end

  def full_name
    first_name + " " + last_name
  end

end
