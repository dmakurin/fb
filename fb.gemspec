require 'rubygems'

Gem::Specification.new do |s|
  s.name = "fb"
  s.version = "0.9.3"
  s.date = "2022-09-19"
  s.summary = "Firebird database driver"
  s.description = "Ruby Firebird Extension Library"
  s.licenses = ["MIT"]
  s.requirements = "Firebird client library fbclient.dll, libfbclient.so or Firebird.framework."
  s.require_path = '.'
  s.author = "Brent Rowland"
  s.email = "rowland@rowlandresearch.com"
  s.homepage = "http://github.com/rowland/fb"
  s.test_file = "test/FbTestSuite.rb"
  s.extra_rdoc_files = ['README']
  s.rdoc_options << '--title' << 'Fb -- Ruby Firebird Extension' << '--main' << 'README' << '-x' << 'test'
  s.files = ['extconf.rb', 'fb.c', 'README', 'fb_extensions.rb'] + Dir.glob("test/*.rb")
  s.platform = case RUBY_PLATFORM
    when /win32/ then Gem::Platform::WIN32
  else
    Gem::Platform::RUBY
  end
  s.extensions = ['extconf.rb'] if s.platform == Gem::Platform::RUBY
end
