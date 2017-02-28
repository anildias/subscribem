require "warden"
require "dynamic_form"

module Subscribem
  class Engine < ::Rails::Engine
    isolate_namespace Subscribem

    # to make our engine always use RSpec
    config.generators do |g|
			g.test_framework :rspec, :view_specs => false
		end

		initializer "subscribem.middleware.warden" do
			Rails.application.config.middleware.use Warden::Manager do |manager|
				manager.default_strategies :password

				manager.serialize_into_session do |id|
					id
				end
				manager.serialize_from_session do |user|
					user_id = user["id"]
					Subscribem::User.find(user_id)
				end
			end
		end
	end
end
