$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "disclaimer/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "disclaimer"
  s.version     = Disclaimer::VERSION
  s.authors     = ["Rob Nichols"]
  s.email       = ["rob@undervale.co.uk"]
  s.homepage    = "https://github.com/reggieb/Disclaimer"
  s.summary     = "Add disclaimers to Rails applications."
  s.description = "Redirects users to a disclaimer document until the user accepts the disclaimer."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 3.2.8"
  s.add_dependency "acts_as_list"

  s.add_development_dependency "sqlite3"
end
