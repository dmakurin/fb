# coding: utf-8

require_relative "lib/fb/version"

Gem::Specification.new do |s|
  s.name = "fb"
  s.version = Fb::VERSION
  s.author = ["Brent Rowland", "REDSOFT"]
  s.email = ["rowland@rowlandresearch.com", "support@red-soft.ru"]

  s.summary = "Ruby Firebird Extension Library"
  s.description = "Ruby Firebird Extension Library"
  s.homepage = "https://github.com/red-soft-ru/ruby-fb"
  s.licenses = ["MIT"]
  s.required_ruby_version = ">= 2.5"

  s.metadata["homepage_uri"] = s.homepage
  s.metadata["source_code_uri"] = "https://github.com/red-soft-ru/ruby-fb"
  s.metadata["documentation_uri"] = "https://github.com/red-soft-ru/ruby-fb/blob/master/USAGE.txt"

  s.files = `git ls-files README.md USAGE.txt ext lib`.split
  s.extensions = ["ext/fb/extconf.rb"]
  s.require_paths = ["lib"]
end
