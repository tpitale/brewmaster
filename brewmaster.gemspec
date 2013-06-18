# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'brewmaster/version'

Gem::Specification.new do |gem|
  gem.name          = "brewmaster"
  gem.version       = Brewmaster::VERSION
  gem.authors       = ["Tony Pitale"]
  gem.email         = ["tpitale@gmail.com"]
  gem.description   = %q{Configuration driven installation and updating of homebrew/brew-casks/rubies.}
  gem.summary       = %q{Given a configuration, it will install homebrew/brew-cask/ruby-build/chruby and use them to install brews, casks, and rubies.}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_development_dependency "rspec"
end
