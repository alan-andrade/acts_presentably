# -*- encoding: utf-8 -*-
require File.expand_path('../lib/acts_presentably/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Mathew Spolin"]
  gem.email         = ["matt@automatt.com"]
  gem.description   = "Enforces presenter pattern for Rails projects"
  gem.summary       = "as_json will look for ClassNamePresenter or :class_name_presenter in options"
  gem.homepage      = ""
  
  gem.add_development_dependency  "bundler", ">= 1.0.21"
  gem.add_development_dependency  "rspec", ">= 2.6"
  gem.add_development_dependency  "sqlite3", ">= 1.3.4"
  gem.add_dependency "activerecord", "~>3.1"

  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = "acts_presentably"
  gem.require_paths = ["lib"]
  gem.version       = ActsPresentably::VERSION
end
