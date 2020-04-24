# frozen_string_literal: true

class SalesTax < ApplicationRecord
  include HTTParty
  base_uri "http://api.salestaxapi.ca/v2/"

  def gst
    self.class.get("/federal/gst")
  end

  def pst(province_code)
    self.class.get("/province/#{province_code}")
  end
end
