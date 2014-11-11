# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'warden_skeleton_key/version'

Gem::Specification.new do |spec|
  spec.name          = "warden_skeleton_key"
  spec.version       = WardenSkeletonKey::VERSION
  spec.authors       = ["Richard Caverly", "Charles Maresh"]
  spec.email         = ["richard.caverly@orm-tech.com", "charles.maresh@orm-tech.com"]
  spec.summary       = %q{WardenSkeletonKey is a Rack middleware to automatically log you into your development environment.}
  spec.description   = %q{WardenSkeletonKey is a Rack middleware to automatically log you into your development environment. Saving you seconds and from forgetting those testing passwords. Was it "test123"?}
  spec.homepage      = "https://github.com/ormtech/warden_skeleton_key"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  # spec.add_development_dependency "bundler", "~> 1.7"
  # spec.add_development_dependency "rake", "~> 10.0"
end
