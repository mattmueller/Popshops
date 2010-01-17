Gem::Specification.new do |s|
  s.name = %q{popshops}
  s.version = "1.0.0"
  s.authors = ["Matt Mueller"]
  s.email = %q{muellermr@gmail.com}
  s.homepage = %q{http://github.com/mattmueller/Popshops}
  s.summary = %q{Ruby gem for accessing the popshops API}
  s.description = %q{The popshops gem provides convenient methods to access all of the popshops.com API features.  It uses hashie to return results that can be used in a more ruby-esque manner than with a plain hash.} 
  s.add_dependency('httparty')
  s.add_dependency('hashie')
end
