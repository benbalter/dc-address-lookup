require 'spec_helper'

describe DcAddressLookup::Client do
  it "makes the request" do
    query = "#{DcAddressLookup::ENDPOINT}?f=json&str=1600%20Pennsylvania%20Ave%20NW"
    stub = stub_request(:get, query).
      to_return(:status => 200, :body => fixture)

    location = subject.lookup(TEST_ADDRESS)
    expect(stub).to have_been_requested
    expect(location.class).to eql(DcAddressLookup::Location)
  end
end
