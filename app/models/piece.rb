# frozen_string_literal: true

class Piece < ApplicationRecord
  belongs_to :size, foreign_key: :sizeId
  belongs_to :detail, foreign_key: :detailId

  has_many :product_orders
  has_many :orders, through: :product_orders, dependent: :destroy

  validates :name, :sizeId, :detailId, presence: true

  paginates_per 5
  max_paginates_per 100

  def self.search(search, size, page)
    search_clause = search_clause search
    size_clause = size_clause size
    where(search_clause).where(size_clause).page(page)
  end

  def self.search_clause(search)
    if !search.to_s.strip.empty?
      'name LIKE "%' + search.strip + '%"'
    else
      '1 = 1'
    end
  end

  def self.size_clause(size)
    if size.to_i.positive?
      "sizeId = #{size}"
    else
      '1 = 1'
    end
  end
end
