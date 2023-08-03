# -*- encoding: utf-8 -*-
$LOAD_PATH.unshift File.expand_path("../lib", __FILE__)
require "stirlitz/version"

Gem::Specification.new do |s|
  s.name = "stirlitz"
  s.version = Stirlitz::Version::STRING
  s.platform = Gem::Platform::RUBY
  s.authors = ["Srushti Ambekallu", "Niranjan Paranjape"]
  s.email = "opensource@c42.in"
  s.homepage = "http://github.com/c42/stirlitz"
  s.summary = "stirlitz-#{Stirlitz::Version::STRING}"
  s.description = "Test spy extension to rspec-mocks"

  s.rubygems_version = "1.3.7"
  #s.rubyforge_project = "stirlitz"

  s.files = `git ls-files`.split("\n")
  s.test_files = `git ls-files -- {spec,features}/*`.split("\n")
  s.executables = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.extra_rdoc_files = [ "README.rdoc" ]
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_path = "lib"

  s.add_runtime_dependency "rspec", ["~> 2.5.0"]
  s.add_runtime_dependency "rspec-mocks", ["~> 2.5.0"]
end

