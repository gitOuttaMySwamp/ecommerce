# frozen_string_literal: true

require 'rubygems'
require 'httparty'

class SalesTax
  include HTTParty
  base_uri 'http://api.salestaxapi.ca/v2/'

  def get_gst
    self.class.get('/federal/gst')
  end
end

sales_tax = SalesTax.new
puts sales_tax.get_gst
