require 'spec_helper'

describe DcAddressLookup::Client do
  it "makes the request" do
    query = "#{DcAddressLookup::ENDPOINT}?f=json&str=1600%20Pennsylvania%20Ave%20NW"
    stub = stub_request(:get, query).
      to_return(:status => 200, :body => fixture("white-house"))

    location = subject.lookup(TEST_ADDRESS)
    expect(stub).to have_been_requested
    expect(location.class).to eql(DcAddressLookup::Location)
  end

  it "doesnt err out on invalid addresses" do
    query = "#{DcAddressLookup::ENDPOINT}?f=json&str=123%20MAIN%20STREET%20NW"
    stub = stub_request(:get, query).
      to_return(:status => 200, :body => fixture("invalid"))

    location = subject.lookup("123 MAIN STREET NW")
    expect(stub).to have_been_requested
    expect(location).to be_nil
  end
end
