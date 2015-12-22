require 'spec_helper'

describe DcAddressLookup::Response do
  subject { DcAddressLookup::Response.new(fixture) }

  it "exposes the body" do
    expect(subject.body).to eql(fixture)
  end

  it "parses the json" do
    expect(subject.send(:parsed).class).to eql(Hash)
  end

  it "traverses down to the table" do
    table = subject.send(:table)
    expect(table.keys.count).to eql(46)
    expect(table.keys.first).to eql("ADDRESS_ID")
    expect(table.values.first).to eql(293211.0)
  end

  it "return the location" do
    expect(subject.location.class).to eql(DcAddressLookup::Location)
  end
end
