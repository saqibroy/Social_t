class SessionsController < Devise::SessionsController
	before_action :check_status, only: [:create]
private
def check_status
	@user= User.find_by_email(params[:user][:email])
  if @user.status?
    
  else
    redirect_to new_user_session_path, notice: 'Your registration request is pending by super admin.'
  end
end
end