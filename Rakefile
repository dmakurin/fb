require "rake/testtask"
require "rake/extensiontask"

Rake::ExtensionTask.new "fb_ext" do |ext|
  ext.ext_dir = 'ext/fb'
  ext.lib_dir = 'lib/fb'
end

Rake::TestTask.new do |t|
  t.test_files = FileList['test/**/*_test.rb']

  t.warning = false
  t.verbose = false
end

task :default => :test
