class HomeController < ApplicationController
  before_action :authenticate_user!
  def index
  		if current_user.has_role? :superAdmin
  			redirect_to super_admin_index_path
  		end
  		
  end

end
