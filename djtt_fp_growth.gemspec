Gem::Specification.new do |s|
  s.name        = 'djtt_fp_growth'
  s.version     = '0.0.2'
  s.date        = '2013-05-16'
  s.summary     = "FP-Growth used in DJTT"
  s.description = "Wrapper around Christian Borgelt's FP-Growth implemenation"
  s.authors     = ["John Drummond"]
  s.email       = 'john@djtechtools.com'
  s.files       = Dir["README", 'lib/**/*.rb', 'ext/**/*.{c,h,rb}']
  s.extensions  = ['ext/djtt_fp_growth/extconf.rb']
  s.homepage    =
    'http://www.djtechtools.com'
end