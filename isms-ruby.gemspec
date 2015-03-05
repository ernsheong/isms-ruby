# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'isms/ruby/version'

Gem::Specification.new do |spec|
  spec.name          = "isms-ruby"
  spec.version       = Isms::Ruby::VERSION
  spec.authors       = ["Jonathan ES Lin"]
  spec.email         = ["ernsheong@gmail.com"]
  spec.summary       = %q{An API wrapper gem for iSMS.}
  spec.description   = %q{A gem to interface with iSMS's API (www.isms.com.my) for SMS sending.}
  spec.homepage      = "https://github.com/ernsheong/isms-ruby"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "faraday", "~> 0.9.1"

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.2.0"
end
