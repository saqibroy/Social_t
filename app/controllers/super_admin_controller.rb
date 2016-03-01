class SuperAdminController < ApplicationController
  before_action :authenticate_user!
  def index
  end
  def user_request
  	@users= User.all.where(status: false)
  end
  def user_request_done
  	@user= User.find(params[:id])
  	@user.status= true
  	
  	if @user.user_type == "Admin"
  		@user.add_role :admin
  	else
  		@user.add_role :user
  	end
  	@user.save
  	redirect_to super_admin_index_path
  end

end
