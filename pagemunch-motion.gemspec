require File.expand_path('../lib/pagemunch-motion/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Luke Roberts"]
  gem.email         = ["email@luke-roberts.co.uk"]
  gem.description   = "A rubymotion client library for interfacing with the Pagemunch API"
  gem.summary       = "A rubymotion client library for interfacing with the Pagemunch API"
  gem.homepage      = "http://pagemunch.com"

  gem.files         = `git ls-files`.split($\)
  gem.name          = "pagemunch-motion"
  gem.require_paths = ["lib"]
  gem.version       = Pagemunch::VERSION

  gem.add_development_dependency 'rake'
end
