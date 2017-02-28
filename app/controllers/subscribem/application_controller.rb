module Subscribem
  class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception

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

    def authenticate_user!
      unless user_signed_in?
        flash[:notice] = "Please sign in."
        redirect_to "/sign_in"
      end
    end

    def force_authentication!(account, user)
      env["warden"].set_user(user, :scope => :user)
      env["warden"].set_user(account, :scope => :account)
    end

  end
end
