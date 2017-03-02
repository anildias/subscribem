require 'rails_helper'

module Subscribem
  RSpec.describe AccountsController, type: :controller do

  	context "creates the account's schema" do
			let!(:account) { stub_model(Subscribem::Account) }

			before do
				Subscribem::Account.should_receive(:create_with_owner).and_return(account)
				account.stub :valid? => true
				controller.stub(:force_authentication!)
			end

			specify do
				account.should_receive(:create_schema)
				post :create, account: { name: "First Account" }, use_route: :subscribem

			end
		end

	end
end