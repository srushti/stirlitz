require 'rubygems'
require 'rspec'
require 'rspec/mocks'

module Stirlitz
end
 
['/stirlitz/**/*.rb'].each do |directory|
  Dir["#{File.expand_path(File.dirname(__FILE__) + directory)}"].each do |file|
    require file
  end
end

