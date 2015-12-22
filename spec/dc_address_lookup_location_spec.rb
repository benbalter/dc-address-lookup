require 'spec_helper'

describe DcAddressLookup::Location do

  subject { DcAddressLookup::Response.new(fixture).location }

  EXPECTATIONS = {
    "address_id"=>293211,
    "status"=>"ACTIVE",
    "fulladdress"=>"1600 PENNSYLVANIA AVENUE NW",
    "addrnum"=>1600,
    "stname"=>"PENNSYLVANIA",
    "street_type"=>"AVENUE",
    "quadrant"=>"NW",
    "city"=>"WASHINGTON",
    "state"=>"DC",
    "anc"=>"2A",
    "psa"=>"Police Service Area 207",
    "ward"=>2,
    "census_tract"=>"006202",
    "vote_prcnct"=>"Precinct 2",
    "zipcode"=>20500,
    "nationalgrid"=>"18S UJ 23390 07392",
    "latitude"=>38.89766766,
    "longitude"=>-77.03654468,
    "ward_2002"=>2,
    "anc_2002"=>"2A",
    "confidencelevel"=>100
  }

  it "parses all the keys" do
    expect(subject.data.count).to eql(46)
  end

  EXPECTATIONS.each do |key, value|
    it "parses the #{key}" do
      expect(subject.send(key)).to eql(value)
    end
  end
end
