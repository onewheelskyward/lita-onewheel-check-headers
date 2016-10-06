require_relative '../../spec_helper'

def mock_up(filename)
  mock_json = File.open("spec/fixtures/#{filename}.json").read
  allow(RestClient).to receive(:get) { mock_json }
end

describe Lita::Handlers::OnewheelCheckHeaders, lita_handler: true do
  before(:each) do
    registry.configure do |config|
      config.handlers.onewheel_check_headers.urls = ''
      config.handlers.onewheel_check_headers.headers = ''
    end
  end

  it { is_expected.to route_command('lllrev') }

  it '!lllrev' do
    send_command 'lllrev'
    expect(replies.last).to eq("Portland, OR, USA weather is currently 28.39°F and clear.  Winds out of the E at 5.74 mph. It will be clear for the hour, and flurries tomorrow morning.  There are also 357.71 ozones.")
  end
end
