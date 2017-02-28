$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "subscribem/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "subscribem"
  s.version     = Subscribem::VERSION
  s.authors     = ["anildias"]
  s.email       = ["anildiasdavis@gmail.com"]
  s.homepage    = ""
  s.summary     = "An engine will provide management for accounts, plans, subscriptions and users."
  s.description = "A subscription engine that can plug into Rails applications. This engine will provide management for accounts, plans, subscriptions and users"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "~> 4.2.6"
  s.add_dependency "bcrypt-ruby", "3.1.5"
  s.add_dependency "warden", "1.2.7"
  s.add_dependency "dynamic_form", "1.1.4"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency 'rspec-rails', '3.5'
  s.add_development_dependency 'capybara', '2.7.1'
  s.add_development_dependency "factory_girl", '4.8.0' 

end
