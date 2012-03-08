# -*- encoding: utf-8 -*-
require File.expand_path('../lib/acts_as_presentable/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Mathew Spolin"]
  gem.email         = ["matt@automatt.com"]
  gem.description   = "Enforces presenter pattern for Rails projects"
  gem.summary       = "as_json will look for ClassNamePresenter or :class_name_presenter in options"
  gem.homepage      = ""

  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = "acts_as_presentable"
  gem.require_paths = ["lib"]
  gem.version       = ActsAsPresentable::VERSION
end
