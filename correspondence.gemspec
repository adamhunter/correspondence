# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "correspondence/version"

Gem::Specification.new do |s|
  s.name        = "correspondence"
  s.version     = Correspondence::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Adam Hunter", "Ben Vandgrift"]
  s.email       = ["adamhunter@me.com", "ben@vandgrift.com"]
  s.homepage    = ""
  s.summary     = %q[Next generation object associations.]
  s.description = %q[Associate related ruby objects, like ActiveRecord assocations for arbitrary classes. Useful for polyglot programming across seperate data stores using different Object Mappers.]

  s.add_dependency 'activesupport', '~> 3.0.0'
  s.add_dependency 'i18n',          '~> 0.5'

  s.add_development_dependency 'rspec', '~> 2.5'

  s.rubyforge_project = "correspondence"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
