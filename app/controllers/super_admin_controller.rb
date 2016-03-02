class SuperAdminController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [ :user_edit, :user_update, :user_destroy]

  def index
  end
  def user_request
  	@users= User.all.where(status: false)
  end
  def user_request_done
  	@user= User.find(params[:id])
  	@user.status= true
  	@user.define_role(@user.user_type)
  	@user.save
  	redirect_to super_admin_user_request_path
  end
  def user_data
    @users= User.all
    respond_to do |format|
      format.html
      format.csv { render text: @users.to_csv }
    end
  end
  def user_new
    @user = User.new
  end
  
  def user_create
    @user = User.new(user_params)
    if @user.status?
      @user.define_role(@user.user_type)
      
    end

    respond_to do |format|
      if @user.save
        format.html { redirect_to super_admin_user_data_path, notice: 'User was successfully created.' }
        format.json { render :user_data, status: :created, location: @user }
      else
        format.html { render :user_new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end
  def user_edit
    
  end
  def user_update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to super_admin_user_data_path, notice: 'User was successfully updated.' }
        format.json { render :user_data, status: :ok, location: @user }
      else
        format.html { render :user_edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end
  def user_destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to super_admin_user_data_path, notice: 'user was successfully destroyed.' }
      format.json { head :no_content }
    end
  end



private

def set_user
      @user = User.find(params[:id])
end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name,:email,:image,:password,:password_confirmation,:user_type,:status)
    end

end
