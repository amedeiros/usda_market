require File.expand_path(File.dirname(__FILE__) + '/test_helper')

class TestUsdaMarket < Test::Unit::TestCase
  ZIP = 33558

  context UsdaMarket::Api do
    context '.initialize' do
      should 'raise an exception for a missing zip' do
        exception = assert_raise ArgumentError do
          UsdaMarket::Api.new()
        end
        assert_equal 'Missing argument zip', exception.message
      end

      should 'set the options' do
        api = UsdaMarket::Api.new(zip: ZIP)
        assert_not_nil api.options
      end
    end

    context '.return_names' do
      setup { @api = UsdaMarket::Api.new(zip: ZIP) }
      should 'return a hash of farmers market names and ids' do
        results = @api.return_names
        assert_includes results.first.keys, 'id'
        assert_includes results.first.keys, 'marketname'
      end
    end

    context '.return_all' do
      setup { @api = UsdaMarket::Api.new(zip: ZIP) }
      should 'return a hash for farmers market names, google map url, products and times' do
        results = @api.return_all
        assert_includes results.first.keys, 'id'
        assert_includes results.first.keys, 'marketname'

        assert_includes results.first.keys, 'Address'
        assert_includes results.first.keys, 'GoogleLink'
        assert_includes results.first.keys, 'Products'
        assert_includes results.first.keys, 'Schedule'
      end
    end
  end
end