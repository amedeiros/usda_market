# Usda Market

Usda Market is a ruby gem for using the USDAs farmers market directory api. For more information on this api see their documentation [here](http://search.ams.usda.gov/farmersmarkets/v1/svcdesc.html)

## Installation

Add this line to your application's Gemfile:

    gem 'usda_market'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install usda_market

## Usage

## Initializer
Takes option arguments. The current only and required option is zip
```ruby
api = UsdaMarket::Api.new(zip: 33558)
```

## Missing argument error
```ruby
api = UsdaMarket::Api.new() => ArugmentError 'Missing argument zip'
```

## Return names
Returns the markets id and name in an array of hashes
```ruby
api     = UsdaMarket::Api.new(zip: 33558)
results = api.return_names
results => [{"id"=>"20049", "marketname"=>"2.8 Cheyennes Country Thangs "}]
```

## Return all
Return all the farmers market information as an array of hashes. ID, Market name, Address, Google Link, Products and Schedule
```ruby
api     = UsdaMarket::Api.new(zip: 33558)
results = api.return_all
results => [{"id"=>"20049", "marketname"=>"2.8 Cheyennes Country Thangs ", "Address"=>"19319 Holly Lane, Lutz, Florida, 33548", "GoogleLink"=>"http://maps.google.com/?q=28.1619%2C%20-82.4747%20(%22Cheyennes+Country+Thangs+%22)", "Products"=>"", "Schedule"=>"    "}]
```

## Author
Andrew Medeiros, amedeiros0920@gmail.com, @_AndrewMedeiros

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. bundle install
4. Commit your changes (`git commit -am 'Add some feature'`)
5. rake test
6. Push to the branch (`git push origin my-new-feature`)
7. Create new Pull Request
