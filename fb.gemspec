# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'fb/version'

Gem::Specification.new do |s|
  s.name = "firebird"
  s.version = Fb::VERSION
  s.date = "2019-06-08"
  s.summary = "Firebird database driver"
  s.description = "Ruby Firebird Extension Library"
  s.licenses = ["MIT"]
  s.requirements = "Firebird client library fbclient.dll, libfbclient.so or Firebird.framework."
  s.require_paths = ["lib", "ext"]
  s.author = "Popa Adrian Marius"
  s.email = "mapopa@gmail.com"
  s.homepage = "http://github.com/mariuz/fb"
  # s.has_rdoc = true
  # s.extra_rdoc_files = ['README']
  # s.rdoc_options << '--title' << 'Fb -- Ruby Firebird Extension' << '--main' << 'README' << '-x' << 'test'
  # s.files = ['ext/fb/extconf.rb', 'ext/fb/fb.c', 'README', 'lib/fb.rb'] + Dir.glob("test/*.rb")
  s.files = `git ls-files`.split($/)
  s.platform = case RUBY_PLATFORM
    when /win32/ then Gem::Platform::WIN32
  else
    Gem::Platform::RUBY
  end
  s.extensions = ['ext/fb/extconf.rb'] if s.platform == Gem::Platform::RUBY
  s.add_development_dependency "rake", ">= 0"
  s.add_development_dependency "rake-compiler", ">= 0"
  if RUBY_VERSION =~ /^2/
    s.add_development_dependency "minitest", ">= 0"
  end
end
