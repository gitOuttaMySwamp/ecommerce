# frozen_string_literal: true

class User < ApplicationRecord
  belongs_to :province, foreign_key: :provinceId
  has_many :order
  has_many :piece, through: :order

  validates :email, :address, :provinceId, presence: true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
