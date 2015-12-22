require 'spec_helper'

describe DcAddressLookup do

  it 'has a version number' do
    expect(DcAddressLookup::VERSION).not_to be nil
  end

  it "looks up an address" do
    query = "#{DcAddressLookup::ENDPOINT}?f=json&str=1600%20Pennsylvania%20Ave%20NW"
    stub = stub_request(:get, query).
      to_return(:status => 200, :body => fixture)

    location = DcAddressLookup.lookup(TEST_ADDRESS)
    expect(stub).to have_been_requested
    expect(location.addrnum).to eql(1600)
    expect(location.stname).to eql("PENNSYLVANIA")
    expect(location.street_type).to eql("AVENUE")
    expect(location.quadrant).to eql("NW")
    expect(location.anc).to eql("2A")
    expect(location.ward).to eql(2)
  end
end
