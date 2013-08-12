class PasswordMailer < ActionMailer::Base
  default from: "no-reply@ctjmb.org"

  # Create new user email and pass it
  def registration_email(registrant)
    @registrant = registrant
    
    mail to: @registrant.email, subject: "Create your CTJ Madrichim credentials"
  end
  
  # Create the password reset email and pass it
  def reset_email(user)
    @user = user
    
    mail to: @user.email, subject: "Change your CTJ Madrichim credentials"
  end
  
end
