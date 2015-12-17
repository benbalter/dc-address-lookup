require 'spec_helper'

describe DcAddressLookup::Client do
  it "makes the request" do
    stub = stub_request(:get, "#{DcAddressLookup::ENDPOINT}?str=1600%20Pennsylvania%20Ave%20NW").
      to_return(:status => 200, :body => fixture)

    location = subject.lookup(TEST_ADDRESS)
    expect(stub).to have_been_requested
    expect(location.class).to eql(DcAddressLookup::Location)
  end
end
