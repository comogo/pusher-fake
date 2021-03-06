require "spec_helper"

describe PusherFake::Configuration do
  it { should have_configuration_option(:app_id).with_default("PUSHER_APP_ID") }
  it { should have_configuration_option(:key).with_default("PUSHER_API_KEY") }
  it { should have_configuration_option(:logger).with_default(STDOUT.to_io) }
  it { should have_configuration_option(:secret).with_default("PUSHER_API_SECRET") }
  it { should have_configuration_option(:socket_options).with_default({ host: "127.0.0.1", port: 8080 }) }
  it { should have_configuration_option(:verbose).with_default(false) }
  it { should have_configuration_option(:web_options).with_default({ host: "127.0.0.1", port: 8081 }) }
  it { should have_configuration_option(:webhooks).with_default([]) }
end

describe PusherFake::Configuration, "#to_options" do
  it "includes the socket host as wsHost" do
    options = subject.to_options

    expect(options).to include(wsHost: subject.socket_options[:host])
  end

  it "includes the socket port as wsPort" do
    options = subject.to_options

    expect(options).to include(wsPort: subject.socket_options[:port])
  end

  it "supports passing custom options" do
    options = subject.to_options(custom: "option")

    expect(options).to include(custom: "option")
  end
end
