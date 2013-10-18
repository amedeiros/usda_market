require 'usda_market/version'
require 'net/http'
require 'json'

module UsdaMarket
  class Api
    attr_accessor :options

    def initialize(options={})
      @options = options
      raise ArgumentError, 'Missing argument zip' if @options[:zip].nil?
    end

    # Returns an array of hashes. Each hash has an id and market name key
    def return_names
      url = URI.parse"http://search.ams.usda.gov/farmersmarkets/v1/data.svc/zipSearch?zip=#{@options[:zip]}"
      JSON.parse(Net::HTTP.get(url)).delete('results')
    end

    # Returns an array of hashes. Each hash has an id, market name, address, time, products and google link
    def return_all
      market_details = return_names.collect do |value|
        url = URI.parse "http://search.ams.usda.gov/farmersmarkets/v1/data.svc/mktDetail?id=#{value['id']}"
        result = JSON.parse(Net::HTTP.get(url) )
        value = value.merge(result.delete('marketdetails'))
        value
      end
      market_details
    end
  end
end


