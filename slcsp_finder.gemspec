# -*- encoding: utf-8 -*-

lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "slcsp_finder/version"

Gem::Specification.new do |gem|  
  gem.name          = "slcsp_finder"
  gem.version       = SlcspFinder::VERSION
  gem.authors       = ["Evangeline Garreau"]
  gem.email         = ["egarreau@gmail.com"]
  gem.summary       = %q{Given a CSV of zip codes, slcsp_finder fills the second column with the rate of the corresponding SLCSP.}
  gem.description   = %q{Determines the second lowest cost silver plan (SLCSP) for a group of ZIP Codes.}

  gem.executables   = ["slcsp_finder"]
  gem.require_paths = ["lib"]
  gem.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.add_development_dependency "bundler", "~> 1.16"
  gem.add_development_dependency "rake", "~> 10.0"
  gem.add_development_dependency "rspec", "~> 3.0"
end  
