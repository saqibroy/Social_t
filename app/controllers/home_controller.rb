class HomeController < ApplicationController
  before_action :authenticate_user!
  def index
  		if current_user.has_role? :superAdmin
  			redirect_to super_admin_index_path
  		end
  		if current_user.status?
        else
          @msg= "Your sign up request is pending by Super Admin, Wait for him to accept your resuest!"
      end
  end

end
