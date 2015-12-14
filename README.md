# DC Address Lookup

*A Ruby gem to look up Washington, D.C. addresses in the master address registry, an official city database*

## Installation

Add the following to your project's Gemfile:

`gem 'dc_address_lookup'`

Then run

`bundle install`

## Usage

```ruby
location = DcAddressLookup.lookup "1600 Pennsylvania Ave NW"
=> #<DcAddressLookup::Location>

location.fulladdress
=> "1600 PENNSYLVANIA AVENUE NW"

location.stname
=> "PENNSYLVANIA"

location.street_type
=> "AVENUE"

location.anc
=> "2A"

location.ward
=> 2

location.psa
=> "Police Service Area 207"

location.zipcode
=> 20500

location.latitude
=> 38.89766766

location.longitude
=> -77.03654468
```
