require 'rubygems'
require 'httparty'
require 'hashie'

class Popshops
  include HTTParty
  base_uri 'api.popshops.com/v2'
  
  def initialize(api_key)
    @api_key = api_key
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
  
end
