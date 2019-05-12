require 'bundler'
Bundler.require

$:.unshift File.expand_path('./../..', __FILE__)

require 'rack/test'
require 'rspec'


ENV['RACK_ENV'] = 'test'

module RSpecMixin
  include Rack::Test::Methods

  def app
    described_class 
  end
end

RSpec.configure do |c| 
  c.include RSpecMixin 
end
