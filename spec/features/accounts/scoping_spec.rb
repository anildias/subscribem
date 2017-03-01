require 'rails_helper'
include Warden::Test::Helpers

$count = 0
feature "Account Scoping" do
	let!(:account_a) { FactoryGirl.create(:account) }
	let!(:account_b) { FactoryGirl.create(:account) }
	let(:root_url) { "http://#{account.subdomain}.example.com/" }

	before do
		Thing.create(name: "Account A", account: account_a)
		Thing.create(name: "Account B", account: account_b)
	end

	scenario "should display only Account A Things" do
		# login_as(account_a, scope: account_a.owner)
		sign_in_as(:user => account_a.owner, :account => account_a)
		visit "/things"
		page.should have_content("Account A Things")
		page.should_not have_content("Account B Things")
	end

end