#!/usr/bin/env rake
require "bundler/gem_tasks"
require 'rspec/core/rake_task'
require 'cucumber'
require 'cucumber/rake/task'

RSpec::Core::RakeTask.new(:spec) do |spec|
  spec.ruby_opts = "-I lib:spec"
  spec.pattern = 'spec/**/*_spec.rb'
end
task :spec

Cucumber::Rake::Task.new(:cuke_features) do |t|
  t.profile = 'default'
end

desc "Run all features"
task :features => [:build_demo, :cuke_features]

desc 'Run all specs and features'
task :test => ['spec', 'features']

task :lib do
  $LOAD_PATH.unshift(File.expand_path("lib", File.dirname(__FILE__)))
end

task :default => :spec

desc 'Builds the ApiDemos application'
task :build_demo do
  Dir.chdir('ApiDemos') do
    stdout = `ant debug`
    raise "Error building ApiDemos: #{stdout}" unless $?.success?
    FileUtils.cp 'bin/ApiDemos-debug.apk', '../features/support/ApiDemos.apk'
    FileUtils.cp File.expand_path('~/.android/debug.keystore'), '../features/support/debug.keystore'
  end
end

desc 'Build iOS Demo application'
task :build_ios do
  Dir.chdir("./iOSDemo") do
    `xcodebuild -project iOSDemo.xcodeproj -target iOSDemo -sdk iphoneos -configuration Debug clean build 1>&2`  
  end
end

desc 'Install iOS app on first iOS device found'
task :ios_install do
  `appdeploy install -p ./iOSDemo/build/Debug-iphoneos/iOSDemo.app`
end
