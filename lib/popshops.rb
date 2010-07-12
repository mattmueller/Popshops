require 'rubygems'
require 'httparty'
require 'hashie'

class Popshops
  include HTTParty
  base_uri 'api.popshops.com/v2'
  
  def initialize(api_key, private_api_key = nil)
    @api_key = api_key
    @private_api_key = private_api_key
  end
  
  def product_search(options={})
    results = self.class.get("/#{@api_key}/products.xml", options)
    Hashie::Mash.new(results['search_results'])
  end
  
  def merchant_search(options={})
    results = self.class.get("/#{@api_key}/merchants.xml", options)
    Hashie::Mash.new(results['merchants'])
  end

  def merchant_types
    results = self.class.get("/#{@api_key}/merchant_types.xml")
    Hashie::Mash.new(results['merchant_types'])
  end

  def networks
    results = self.class.get("/#{@api_key}/networks.xml")
    Hashie::Mash.new(results['networks'])
  end
  
  def deal_search(options={})
    results = self.class.get("/#{@api_key}/deals.xml", options)
    Hashie::Mash.new(results['search_results'])
  end
  
  def deal_types
    results = self.class.get("/#{@api_key}/deal_types.xml")
    Hashie::Mash.new(results['deal_types'])
  end   
  
  def catalogs
    results = self.class.get("https://www.popshops.com/v2/#{@api_key}/catalogs/list.xml?private_api_key=#{@private_api_key}")
    Hashie::Mash.new(results['results']['catalogs'])
  end
  
  # Activates merchants for the given catalog.
  #
  # merchants can be either a string, an integer, or an array of ids.
  def activate_merchants(catalog_key, merchants)
    results = self.class.post(catalog_update_url(catalog_key, merchants), :query => { :active => 1 })
    Hashie::Mash.new(results['response'])
  end
  
  # Deactivates merchants for the given catalog.
  #
  # merchants can be either a string, an integer, or an array of ids.
  def deactivate_merchants(catalog_key, merchants)
    results = self.class.post(catalog_update_url(catalog_key, merchants), :query => { :active => 0 })
    Hashie::Mash.new(results['response'])
  end
  
  private
    def catalog_update_url(catalog_key, merchants)
      "https://www.popshops.com/v2/#{@api_key}/catalogs/update.xml?catalog_key=#{catalog_key}&private_api_key=#{@private_api_key}&merchant_id=#{normalize_merchants(merchants)}"
    end
    
    def normalize_merchants(merchants)
      merchants.is_a?(Array) ? merchants.join(',') : merchants
    end
end
