require "bundler/setup"

Bundler.require(:default, :development)

Dir[File.expand_path("../support/**/*.rb", __FILE__)].each do |file|
  require file
end

RSpec.configure do |config|
  config.mock_with   :mocha
  config.expect_with :rspec do |rspec|
    rspec.syntax = :expect
  end
end
