$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "disclaimer/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "disclaimer"
  s.version     = Disclaimer::VERSION
  s.authors     = ["Rob Nichols"]
  s.email       = ["rob@undervale.co.uk"]
  s.homepage    = "http://undervale.co.uk"
  s.summary     = "TODO: Summary of Disclaimer."
  s.description = "TODO: Description of Disclaimer."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 3.2.8"
  # s.add_dependency "jquery-rails"

  s.add_development_dependency "sqlite3"
end
