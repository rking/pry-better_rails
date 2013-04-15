# -*- encoding: utf-8 -*-
$:.unshift 'lib'
require 'pry-better_rails/version'

SUMMARY = %(A metagem to tersify "gem 'pry-plus'; gem 'pry-rails'; gem 'better_errors'", and some additional commands)

Gem::Specification.new do |s|
  s.name = 'pry-better_rails'
  s.summary = SUMMARY
  s.description = SUMMARY
  s.version = PryBetterRails::VERSION
  s.authors = ['☈king', 'Faraaz Ismail']
  s.email = 'pry-better_rails@sharpsaw.org'
  s.homepage = 'https://github.com/rking/pry-better_rails'
  %w(pry-plus pry-rails better_errors).each do |e|
    s.add_runtime_dependency e
  end
  s.files = `git ls-files`.split "\n"
end
