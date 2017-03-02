::ApplicationController.class_eval do
	helper_method :current_user
  helper_method :current_account
  helper_method :user_signed_in?

  def current_user
  	if user_signed_in?
  		@current_user ||=
  		begin
  			user_id = env['warden'].user(scope: :user)
  			Subscribem::User.find(user_id)
  		end
  	end
  end

  def current_account
  	@current_account ||= Subscribem::Account.find_by(subdomain: request.subdomain)
  end

  def user_signed_in?
  	env["warden"].authenticated?(:user)
  end
  
end