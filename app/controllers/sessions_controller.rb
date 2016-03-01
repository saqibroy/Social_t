class SessionsController < Devise::SessionsController
private
def check_status
  if current_user.status?
    
  else
    @msg= "Your request is pending by Super Admin, Wait for him to accept your resuest!"
    
  end
end
end