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
  	if user_signed_in?
  		@current_account ||=
  		begin
  			account_id = env['warden'].user(scope: :account)
  			Subscribem::Account.find(account_id)
  		end
  	end
  end

  def user_signed_in?
  	env["warden"].authenticated?(:user)
  end
  
end