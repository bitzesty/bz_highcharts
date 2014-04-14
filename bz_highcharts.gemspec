$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "bz_highcharts/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "bz_highcharts"
  s.version     = BzHighcharts::VERSION
  s.authors     = ["Bit Zesty"]
  s.email       = ["info@bitzesty.com"]
  s.homepage    = "http://bitzesty.com/"
  s.summary     = "Provides structure for highcharts loaded via json ajax."
  s.description = "Provides structure for highcharts loaded via json ajax."
  s.license     = 'MIT'

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["spec/**/*"]

  s.add_development_dependency "rails", "~> 4.0.4"
  s.add_development_dependency "sqlite3"

  s.add_development_dependency 'rspec-rails'
  s.add_development_dependency 'capybara'
  s.add_development_dependency 'factory_girl_rails'

  s.add_development_dependency "slim-rails", "~> 2.0"
  s.add_development_dependency "sass-rails", "~> 4.0.2"
  s.add_development_dependency "coffee-rails", "~> 4.0"
  s.add_development_dependency "uglifier", ">= 1.3"
  s.add_development_dependency "execjs"
  s.add_development_dependency "kaminari"

  s.add_development_dependency "bootstrap-sass", ">= 3.0"
  s.add_development_dependency "jquery-rails"
  s.add_development_dependency "jquery-ui-rails"

  s.add_development_dependency "pry-rails"
end
