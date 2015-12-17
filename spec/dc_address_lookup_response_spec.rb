require 'spec_helper'

describe DcAddressLookup::Response do
  subject { DcAddressLookup::Response.new(fixture) }

  it "exposes the body" do
    expect(subject.body).to eql(fixture)
  end

  it "parses the doc" do
    expect(subject.send(:document).class).to eql(Nokogiri::XML::Document)
  end

  it "traverses down to the table" do
    table = subject.send(:table)
    expect(table.children.count).to eql(87)
    expect(table.children[1].text).to eql("293211")
  end

  it "return the location" do
    expect(subject.location.class).to eql(DcAddressLookup::Location)
  end
end
