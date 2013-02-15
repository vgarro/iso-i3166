# -*- encoding: utf-8 -*-
require File.expand_path('../lib/iso-i3166/version', __FILE__)

Gem::Specification.new do |gem|
  gem.date          = '2013-02-14'
  gem.authors       = ['Chris Kalafarski', 'Victor Garro']
  gem.email         = ['chris@farski.com', 'vgarro@verticalresponse.com']
  gem.description   = %q{Country and State lookup based on ISO-3166-1 and ISO-3166-2}
  gem.summary       = %q{Country and State lookup based on ISO-3166-1 and ISO-3166-2}
  gem.homepage      = 'https://github.com/farski/iso-country'
  gem.licenses      = ['MIT']

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = 'iso-i3166'
  gem.require_paths = ['lib']
  gem.version       = Iso::I3166::VERSION
end
