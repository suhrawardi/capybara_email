# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)

Gem::Specification.new do |s|
  s.name = "capybara_email"
  s.rubyforge_project = ""
  s.version = 0.1

  s.authors = ["Jarra Schirris"]
  s.email = ["suhrawardi@gmail.com"]
  s.description = "a lean capybara email functionality"

  s.files = Dir.glob("{lib,test}/**/*") + %w(README.rdoc)
  s.extra_rdoc_files = ["README.rdoc"]

  s.homepage = "http://github.com/suhrawardi/capybara_email"
  s.rdoc_options = ["--main", "README.rdoc"]
  s.require_paths = ["lib"]
  s.rubygems_version = "1.3.6"
  s.summary = "Add the ability to use emails to Cucumber and Capybara"

  s.add_runtime_dependency("actionmailer", [">= 3.0.1"])
end
