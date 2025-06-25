class Item < ApplicationRecord
  has_one_attached :image
  #has_one :purchase
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :shopping_fee
  belongs_to :prefecture
  belongs_to :delivery_time
  belongs_to :user

  with_options presence: true do
    validates :name
    validates :explanation
    validates :price
    validates :image
    validates :category_id
    validates :status_id
    validates :shopping_fee_id
    validates :prefecture_id
    validates :delivery_time_id
  end

  with_options numericality: { other_than: 1, message: "can't be blank" } do
    validates :category_id
    validates :status_id
    validates :shopping_fee_id
    validates :prefecture_id
    validates :delivery_time_id
  end

  validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
end
