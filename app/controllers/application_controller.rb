class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
    before_filter :user_requests
  protect_from_forgery with: :exception

      def user_requests
      @requests= User.all.where(status: false).limit(3)
      @count= @requests.count
      @words_count= Word.all.count
      @applications_count= Application.all.count
      @users_count= User.all.where(status: true).count
      if current_user.present?
      	@noti= Notification.all.where(user_id: current_user.id).limit(3)
      	@noti_count= Notification.all.where(user_id: current_user.id).count
      	@msg_count= Message.all.where(user_id: current_user.id).count
      end

      
    end
end
