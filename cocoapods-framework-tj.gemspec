# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'cocoapods-framework/gem_version.rb'

Gem::Specification.new do |spec|
  spec.name          = 'cocoapods-framework-tj'
  spec.version       = CocoapodsFramework::VERSION
  spec.authors       = ['song']
  spec.email         = ['1173742025@qq.com']
  spec.description   = %q{A short description of cocoapods-framework-tj.}
  spec.summary       = %q{A short description of cocoapods-framework-tj.}
  spec.homepage      = 'https://github.com/songpanfei/cocoapods-framework-tj'
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']
  spec.add_dependency "cocoapods", '>= 1.10.0', '< 2.0'

  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'rake'
end
